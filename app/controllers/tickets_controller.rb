# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.includes(:excavator).order(id: :desc).page(params[:page]).per(9)
  end

  def show
    @coordinates = ticket.well_known_text.scan(/(-?\d+\.\d+)\s(-?\d+\.\d+)/)
  end

  private

  def ticket
    @ticket ||= Ticket.find(params[:id])
  end
end
