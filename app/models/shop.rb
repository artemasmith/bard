# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  ip           :string(255)
#  out_id       :integer
#  user_id      :integer
#  auth_token   :string(255)
#  token_expire :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  address      :string(255)
#  title        :string(255)
#  shop_type    :string(255)
#

class Shop < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :wares

  before_create :generate_token
  before_create :check_user_tariff

  #TODO: save in log file info about auth_token expiration
  #after_update :observe_to_log

  enum state: [:normal, :disabled]

  def get_token
    if self.normal?
      if Date.today > self.token_expire
        self.generate_token
        self.save
        return :token_expire
      else
        return self.auth_token
      end
    else
      return :shop_disabled
    end
  end

  def add_ware ware_id
    ware = Ware.find(ware_id.to_i)
    if self.wares.include?(ware)
      return 'ware are already in list'
    else
      self.wares << ware
    end
  end

  #wares - string of barcodes or ALL string
  def get_wares wares
    result = { 'unrecognized_wares' => [], 'characteristics' => [], 'wares' => [], 'properties' => [], 'categories' =>
        [], 'values' => [] }
#TODO Refactor this!!!!!!!!
    if wares == 'ALL'
      self.wares.each do |ware|
        temp = JSON(ware.to_json)
        temp['barcode'] = (ware.barcodes.present?) ? ware.barcodes.last.number : 'unknown barcode or group'
        result['wares'] << temp
        if ware.characteristics.present?
          ware.characteristics.each do |c|
            temp1 = JSON(c.to_json)
            temp1['ware_id'] = ware.id
            result['characteristics'] << temp1
          end
        end
      end
    else
      wares.split(',').each do |b|
        tb = Barcode.find_by_number(b)
        ware = tb.try :ware
        if tb.present? && ware.present?
          if ware.characteristics.present?
            ware.characteristics.each do |c|
              temp1 = JSON(c.to_json)
              temp1['ware_id'] = ware.id
              result['characteristics'] << temp1
            end
          end
          temp = JSON(ware.to_json)
          temp['barcode'] = tb.number
          result['wares'] << temp
          #### HERE We've got a nice piece of shit code, Honestly we should use observer but it would be very complicated.
          self.add_ware ware.id
        else
          result['unrecognized_wares'] << b.to_json
        end
      end
    end

    Property.all.each { |p| result['properties'] << JSON(p.to_json) }
    Category.all.each { |c| result['categories'] << JSON(c.to_json) }
    Value.all.each { |v| result['values'] << JSON(v.to_json) }
    result
  end

  def generate_token
    self.auth_token = Digest::MD5.hexdigest("#{self.user_id} - #{Time.now}")
    self.token_expire = Date.today + 1.year
  end

  def check_user_tariff
    if self.user.shops.count >= self.user.tariff.shops_count
      errors.add(:user_id, "Too many shops in this tariff")
    end
  end
end
 
