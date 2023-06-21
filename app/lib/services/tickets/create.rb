# frozen_string_literal: true

module Services
  module Tickets
    class Create
      def initialize(params = {})
        @params = params.to_h.deep_transform_keys(&:underscore)
      end

      def call
        return if params.blank?

        Ticket.create(ticket_params)
      end

      private

      attr_reader :params

      def ticket_params
        params.slice(:request_number, :sequence_number, :request_type, :request_action)
              .merge(response_due_date_time:,
                     primary_service_area_code:,
                     additional_service_area_codes:,
                     well_known_text:,
                     excavator_attributes:)
      end

      def response_due_date_time
        params.dig(:date_times, :response_due_date_time)
      end

      def primary_service_area_code
        params.dig(:service_area, :primary_service_area_code, :sa_code)
      end

      def additional_service_area_codes
        params.dig(:service_area, :additional_service_area_codes, :sa_code)
      end

      def well_known_text
        params.dig(:excavation_info, :digsite_info, :well_known_text)
      end

      def excavator_attributes
        excavator_data.slice(:company_name, :crew_onsite).merge(address:)
      end

      def address
        excavator_data.values_at(:address, :city, :state, :zip).join(', ')
      end

      def excavator_data
        @excavator_data ||= params[:excavator] || {}
      end
    end
  end
end
