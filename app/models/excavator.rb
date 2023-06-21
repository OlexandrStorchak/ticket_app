# frozen_string_literal: true

class Excavator < ApplicationRecord
  validates :company_name, presence: true
  validates :crew_onsite, presence: true
  validates :address, presence: true

  belongs_to :ticket
end
