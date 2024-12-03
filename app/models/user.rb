class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }


  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize: "#{width}x#{height}")
    else
      'no_image.jpg'
    end
  end
end
