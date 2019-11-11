# frozen_string_literal: true

module Algos
  class Heap

    attr_reader :data

    def initialize(new_data)
      @data = []
      new_data.each do |value|
        insert(value)
      end
    end

    def peek
      @data.first
    end

    def pop
      last_index = @data.count - 1
      result = @data[0]
      @data[0] = @data.delete_at(last_index)
      @data = filter_down
      result
    end

    def insert(value)
      new_index = @data.count
      @data[new_index] = value
      heap_up
    end

    private

    def heap_up(current_index = @data.count - 1)
      node_value = @data[current_index]
      parent_value = @data[parent_index(current_index)]
      return @data if current_index.zero? || parent_value <= node_value

      @data[current_index] = parent_value
      @data[parent_index(current_index)] = node_value
      heap_up(parent_index(current_index))
    end

    def filter_down(current_index = 0)
      left_index = left_child_index(current_index)
      right_index = right_child_index(current_index)

      largest = current_index
      largest = left_index if left_index < @data.count && @data[left_index] < @data[largest]
      largest = right_index if right_index < @data.count && @data[right_index] < @data[largest]

      if largest != current_index
        tmp = @data[current_index]
        @data[current_index] = @data[largest]
        @data[largest] = tmp
        return filter_down(largest)
      end
      @data
    end

    def left_child_index(current_index)
      2 * current_index + 1
    end

    def right_child_index(current_index)
      2 * current_index + 2
    end

    def parent_index(current_index)
      ((current_index - 1) / 2).floor
    end
  end
end
