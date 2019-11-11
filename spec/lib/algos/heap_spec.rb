require 'spec_helper'
require 'algos'
require 'pry'
describe Algos::Heap do
  let(:heap) do
    Algos::Heap.new([11, 8, 4, 3, 5, 10, 7])
  end

  describe '#peek' do
    subject { heap.peek }
    it { is_expected.to eq 3 }

    it 'has a heap of data' do
      binding.pry
    end
  end

  describe '#pop' do
    subject { heap.pop }
    it { is_expected.to eq 3}

    it 're-heaps' do
      heap.pop
      expect(heap.peek).to eq 4
    end
  end
  #             3
  #          4     7
  #    11    5     10    8
  #
  #             3
  #         4      7
  #    9   5      10    8
  #   11

  #           11
  #       4        7
  #
end