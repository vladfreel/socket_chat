require 'elasticsearch/model'

class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram, :google_oauth2, :github]

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :memberships
  has_many :private_chat_rooms, through: :memberships
  has_many :private_messages, dependent: :destroy

  has_many :multi_user_memberships
  has_many :multi_user_private_chat_rooms, through: :multi_user_memberships
  has_many :multi_user_messages, dependent: :destroy

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  # validates_format_of :username, with: /^[a-zA-Zа-яА-Я0-9_\._]*$/, :multiline => true
  validates :email, presence: true, if: :check_provider
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, if: :check_provider
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :username, analyzer: 'english', index_options: 'offsets'
    end
  end
  def check_provider
    provider == nil
  end
  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['username']
                }
            }
        }
    )
  end

  def name
    username
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = "#{auth.info.name.delete(' ')}.#{auth.provider}"
      user.avatar = auth.info.image
      user.password = Devise.friendly_token[0, 20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

end
User.__elasticsearch__.create_index! force: true
User.import(force: true)
