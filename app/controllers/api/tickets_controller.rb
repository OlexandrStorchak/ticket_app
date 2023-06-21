# frozen_string_literal: true

module Api
  class TicketsController < ApiApplicationController
    skip_before_action :verify_authenticity_token

    def create
      ticket = Services::Tickets::Create.new(params).call
      return unprocessable_entity!(ticket.errors) unless ticket.valid?

      render json: { message: 'Ticket created successfully' }, status: :created
    end
  end
end
