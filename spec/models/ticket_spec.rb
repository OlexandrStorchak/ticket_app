# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:request_number) }
    it { should validate_presence_of(:sequence_number) }
    it { should validate_presence_of(:request_type) }
    it { should validate_presence_of(:request_action) }
    it { should validate_presence_of(:response_due_date_time) }
    it { should validate_presence_of(:primary_service_area_code) }
    it { should validate_presence_of(:additional_service_area_codes) }
    it { should validate_presence_of(:well_known_text) }
  end

  describe 'associations' do
    it { should have_one(:excavator) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:excavator) }
  end
end
