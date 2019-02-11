# == Schema Information
#
# Table name: materials
#
#  id          :bigint(8)        not null, primary key
#  supplier_id :integer
#  name        :string
#  price       :decimal(8, 2)
#  unit        :integer
#  is_active   :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Material < ApplicationRecord
  # ######################
  # CONSTANTS
  # ######################

  # ######################


  # ######################
  # SCOPES
  # ######################
  scope :is_active, -> { where(is_active: true) }
  # ######################

  
  # ######################
  # SEARCH SCOPES
  # ######################

  # ######################


  # ######################
  # PLUGINS / MODULES
  # ######################

  # ######################


  # ######################
  # ASSOCIATIONS
  # ######################
  belongs_to :supplier
  has_one :vendor, through: :supplier
  # ######################


  # ######################
  # VALIDATIONS
  # ######################
  validates :name, presence: true
  validates :price, :unit, presence: true
  # ######################


  # ######################
  # ENUMERATORS
  # ######################
  enum unit: [:yard, :ton, :pound, :piece]
  # ######################


  # ######################
  # CALLBACKS
  # ######################

  # ######################


  private
  
end
