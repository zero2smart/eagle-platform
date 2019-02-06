# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string
#

class User < ApplicationRecord
  # attr_accessor :remove_avatar

  # ######################
  # CONSTANTS
  # ######################

  # ######################


  # ######################
  # SCOPES
  # ######################

  # ######################

  
  # ######################
  # SEARCH SCOPES
  # ######################

  # ######################


  # ######################
  # PLUGINS / MODULES
  # ######################
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #, :confirmable

  # has_attached_file :avatar, styles: {
  #   thumb: ['55x55#', :png],
  #   medium: ['150x82>', :png],
  #   large: ['750x410>', :png]
  # },
  # default_url: lambda { |image| ActionController::Base.helpers.asset_url('avatar-default.png') }
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # ######################


  # ######################
  # ASSOCIATIONS
  # ######################
  # belongs_to :vendor, optional: true
  # ######################


  # ######################
  # VALIDATIONS
  # ######################
  validates :name, presence: true
  # validates :vendor_id, presence: true, unless: Proc.new { |u| u.isle_admin? }

  # validates :phone_number, presence: true
  # phony_normalize :phone_number, default_country_code: 'US'
  # validates_plausible_phone :phone_number, normalized_country_code: 'US', presence: true
  # ######################


  # ######################
  # ENUMERATORS
  # ######################
  # enum role: [:isle_admin, :sales, :admin]
  # ######################


  # ######################
  # CALLBACKS
  # ######################
  before_save :ensure_auth_token
  # before_save :delete_avatar, if: ->{ remove_avatar == '1' && !avatar_updated_at_changed? }
  # ######################

  def short_name
    names = name.split(' ')
    "#{names[0]} #{names[1].first}."
  end
  
  private
    def generate_auth_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(auth_token: token).first
      end
    end
    
    def ensure_auth_token
      self.auth_token = generate_auth_token if self.auth_token.blank?
    end
  
end
