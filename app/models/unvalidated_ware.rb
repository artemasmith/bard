# == Schema Information
#
# Table name: unvalidated_wares
#
#  id         :integer          not null, primary key
#  barcode    :string(255)
#  title      :string(255)
#  comment    :text
#  shop_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UnvalidatedWare < ActiveRecord::Base
  belongs_to :shop
  has_one :user, through: :shop
  validates :barcode, :title, presence: true

  #do I need this validation method?????
  def validate_ware
    barcode = Barcode.find_by_number(self.barcode)
    Ware.create(title: self.title, spec: self.comment)
  end

  def self.create_by_request swares
    wares = JSON(swares)
    shop_id = wares['shop_id'].to_i
    return { errors: 'no wares provided' }.to_json if wares['uwares'].blank?
    wares['uwares'].each do |ware|
      w = UnvalidatedWare.new(ware)
      w.shop_id = shop_id
      if !w.save
        return { errors: "wrong ware params #{w.errors.full_messages}" }.to_json
      end
    end
    'successful creation'.to_json
  end
end
