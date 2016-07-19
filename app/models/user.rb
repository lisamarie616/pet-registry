class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :username, presence: true
  has_many :animals
  before_save :format_data

  protected
  def format_data
    self.username = self.username.titlecase
  end
end
