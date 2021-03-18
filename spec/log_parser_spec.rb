# frozen_string_literal: true

require 'log_parser'

describe LogParser do
  describe 'perform' do
    context 'when the file is empty' do
      let(:empty_output) {
        <<~OUTPUT
          ####### Total Visits #######
          Page : Visits
          ####### Total Unique Visits #######
          Page : Visits
          ########################
        OUTPUT
      }
      subject { described_class.new('spec/support/fixtures/webserver_empty.log').perform }
      it 'returns only the header and footer' do
        expect { subject }.to output(empty_output).to_stdout
      end
    end

    context 'when the file is not empty' do
      let(:expected_output) {
        <<~OUTPUT
          ####### Total Visits #######
          Page : Visits
          /help_page/1 : 1
          /contact : 1
          ####### Total Unique Visits #######
          Page : Visits
          /help_page/1 : 1
          /contact : 1
          ########################
        OUTPUT
      }
      subject { described_class.new('spec/support/fixtures/webserver.log').perform }
      it 'returns only the header and footer' do
        expect { subject }.to output(expected_output).to_stdout
      end
    end
  end
end