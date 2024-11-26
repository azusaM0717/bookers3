class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates :introduction, presence: true

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
