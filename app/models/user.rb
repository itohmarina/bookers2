class User < ApplicationRecord
  has_many:books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many:books,dependent: :destroy

  validates :name, presence:true, length:{minimum:2,maximum:20}, uniqueness:true
  validates :introduction, length:{maximum:50}

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path= Rails.root.join('app/assets/images/no_image.jpg')#画像のファイルパス取得
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


end
