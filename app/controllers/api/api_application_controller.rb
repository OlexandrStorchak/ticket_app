# frozen_string_literal: true

module Api
  class ApiApplicationController < ApplicationController
    UNPROCESSABLE_ENTITY_CODE = 422

    private

    def unprocessable_entity!(errors)
      error = errors.is_a?(ActiveModel::Errors) ? errors.full_messages.to_sentence : errors
      render json: { error: }, status: UNPROCESSABLE_ENTITY_CODE
    end
  end
end
