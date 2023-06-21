# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::Tickets::Create do
  describe '#call' do
    context 'create Ticket' do
      subject { described_class.new(params) }
      let(:tickets) { Ticket.all }
      let(:params) do
        ActionController::Parameters.new(
          JSON.parse(File.read('spec/fixtures/ticket_valid.json'))
        ).deep_transform_keys!(&:underscore)
      end
      let(:expected_params) { JSON.parse(File.read('spec/fixtures/ticket_expected.json')) }

      after { subject.call }

      it { expect { subject.call }.to change(tickets, :size).by(1) }
      it { expect(Ticket).to receive(:create).with(expected_params) }
    end
  end
end
