# frozen_string_literal: true

require 'output_info'

describe OutputInfo do
  describe 'info' do
    context 'with output_type' do
      let(:expected_output) {
        <<~OUTPUT
          ####### Total Visits #######
          Page : Visits
        OUTPUT
      }
      subject { described_class.info([], 'total_visits') }
      it 'returns the correct output' do
        expect { subject }.to output(expected_output).to_stdout
      end
    end

    context 'without output_type' do
      subject { described_class.info([], nil) }
      it 'raises an error' do
        expect { subject }.to raise_error(StandardError, 'output type is required')
      end
    end
  end

  describe 'header' do
    let(:expected_output) {
      <<~OUTPUT
        ####### Total Visits #######
        Page : Visits
      OUTPUT
    }
    subject { described_class.header('Total Visits') }
    it 'returns the correct output' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end

  describe 'footer' do
    let(:expected_output) {
      <<~OUTPUT
        ########################
      OUTPUT
    }
    subject { described_class.footer }
    it 'returns the correct output' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end
end
