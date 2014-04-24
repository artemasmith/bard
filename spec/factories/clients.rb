# == Schema Information
#
# Table name: clients
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  specs                  :text
#  login                  :string(255)
#  pass                   :string(255)
#  blocked                :boolean
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

#FactoryGirl.define do#  factory :client do#    title 'test'#    login 'login'#    pass 'pass'#  end
#end
