class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      file_path = Rails.root.join('app/assets/images/sample-user1.jpg')
      self.profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
  end
end
