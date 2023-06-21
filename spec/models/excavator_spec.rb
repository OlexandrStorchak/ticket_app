# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Excavator, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:crew_onsite) }
    it { should validate_presence_of(:address) }
  end

  describe 'associations' do
    it { should belong_to(:ticket) }
  end
end
