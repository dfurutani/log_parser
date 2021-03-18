# frozen_string_literal: true

require 'results_sorter'

describe ResultsSorter do
  describe 'sort_results' do
    let(:input) {
      { '/help_page/1' => ['126.318.035.038'],
        '/contact' => ['184.123.665.067', '126.318.035.038'] }
    }
    let(:high) { ['/contact', ['184.123.665.067', '126.318.035.038']] }
    let(:low) { ['/help_page/1', ['126.318.035.038']] }

    context 'with asc sorting information' do
      subject { described_class.sort_results(input, 'asc') }
      it 'returns the correct sorted results' do
        expect(subject.first).to eq(high)
        expect(subject.last).to eq(low)
      end
    end

    context 'with desc sorting information' do
      subject { described_class.sort_results(input, 'desc') }
      it 'returns the correct sorted results' do
        expect(subject.first).to eq(low)
        expect(subject.last).to eq(high)
      end
    end
  end
end
