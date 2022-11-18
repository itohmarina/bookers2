class User < ApplicationRecord
  has_many:books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :books, dependent: :destroy

  def get_profile_image
    unless profile_image.attached?
      file_path= Rails.root.join('app/assets/images/no_image.jpg')#画像のファイルパス取得
      profile_image.attach(io: File.open(file_path))
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
