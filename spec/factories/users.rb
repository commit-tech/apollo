# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           not null
#  name                   :string           not null
#  email                  :string           default(""), not null
#  matric_number          :string           not null
#  phone_number           :string           not null
#  cell                   :string           not null
#  position               :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_matric_number         (matric_number) UNIQUE
#  index_users_on_phone_number          (phone_number) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

FactoryGirl.define do
  factory :user do
    username { generate(:unique) }
    name 'Herbert Ilhan'
    password { generate(:unique) }
    email { "#{generate(:unique)}@gmail.com" }
    matric_number { generate(:unique) }
    phone_number { generate(:unique) }
    cell 'Techinical'
    position 'Head'
  end
end
