# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Tickets', type: :request do
  describe '#create' do
    subject { response }
    let(:end_point) { '/api/tickets' }
    let!(:send_request) { post end_point, params: }

    context 'when valid params' do
      let(:params) { JSON.parse(File.read('spec/fixtures/ticket_valid.json')) }

      it { is_expected.to be_successful }
      it { is_expected.to have_http_status(:created) }
    end

    context 'when invalid params' do
      let(:params) { JSON.parse(File.read('spec/fixtures/ticket_invalid.json')) }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end
end
