require "amura/version"
module Amura
  class Amura

    attr_accessor :result
    def initialize(array)
      raise TypeError, "All Element should be of Integer type" unless array.all? {|i| i.is_a?(Integer)}
      @input = array
      self.result = contiguous_sub_array
    end
    def sum
      result.sum
    end
    def start_index
      @start_index += 1
    end

    def length
      result.length
    end

    private
    def contiguous_sub_array
      temp_stack = [@input[0]]
      final_stack = [@input[0]]
      temp_start_index = 0
      @input[1..@input.length].each_with_index do |element, index|
        element > (temp_stack.sum + element) ? ((temp_stack.clear.push element); temp_start_index = index): temp_stack << element
        (final_stack =  temp_stack.map{|e| e}; @start_index = temp_start_index) if temp_stack.sum > final_stack.sum
      end
      final_stack
    end
  end
end


class Array
  def sum
    result = 0
    each{|i| result = result+i}
    result
  end
end