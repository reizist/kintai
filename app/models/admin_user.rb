class AdminUser < ApplicationRecord
  devise :database_authenticatable, :trackable, :validatable
end
