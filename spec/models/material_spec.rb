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

require 'rails_helper'

RSpec.describe Material, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
