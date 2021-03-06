class Animal < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: ":style/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, :animal_type, :sex, presence: true
  before_save :format_data

  scope :with_animal_type, lambda {|animal_types| where(animal_type: [*animal_types])}

  filterrific(
    available_filters: [
      :with_animal_type
    ]
  )

  def self.options_for_select
    order('LOWER(animal_type)').map {|e| e.animal_type}.uniq
  end

  protected
  def format_data
    self.name = self.name.titlecase
    self.animal_type = self.animal_type.titlecase
  end
end
