# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  describe 'GET /index' do
    let!(:send_request) { get '/tickets' }

    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET /show' do
    let(:ticket_id) { Ticket.last.id }
    let!(:send_request) { get "/tickets/#{ticket_id}" }

    it { expect(response).to have_http_status(:success) }
  end
end
