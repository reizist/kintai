class User < ApplicationRecord
  devise :trackable, :omniauthable
end
