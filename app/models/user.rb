class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         

  has_many :items
  has_one :order
  has_many :messages
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birthday
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :first_name
    validates :family_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana
    validates :family_name_kana
  end
end
