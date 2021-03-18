# frozen_string_literal: true

require 'file_formatter'

describe FileFormatter do
  describe 'format_data' do
    context 'with no file_data' do
      let(:file_data) { nil }
      subject { described_class.new(file_data) }
      it 'returns only the header and footer' do
        expect { subject.format_data }.to raise_error NoMethodError
      end
    end
    context 'with file_data' do
      let(:file_data) { ['/help_page/1 126.318.035.038'] }
      let(:result) { {'/help_page/1' => ['126.318.035.038']} }

      subject { described_class.new(file_data) }
      it 'returns only the header and footer' do
        subject.format_data
        expect(subject.results).to eq(result)
      end
    end
  end
end
