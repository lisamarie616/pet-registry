class Animal < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: ":style/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, :type, :sex, presence: true
end
