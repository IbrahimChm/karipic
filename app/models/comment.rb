class Comment < ApplicationRecord
  belongs_to :user

  def commenter_profile_picture
    user.profile_picture
  end
end