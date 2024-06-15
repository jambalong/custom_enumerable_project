module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    self.my_each do |element|
      yield element, index
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    object = []

    self.my_each do |element|
      yield element
      object << element if yield element
    end

    object
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.my_each do |element|
      return false unless yield element
    end

    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    self.my_each do |element|
      return true if yield element
    end

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    self.my_each do |element|
      return false if yield element
    end

    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each do |element|
      count += 1 if yield element
    end

    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    object = []
    self.my_each do |element|
      element = yield element
      object << element
    end

    object
  end

  def my_inject(initial = nil)
    return to_enum(:my_inject) unless block_given?

    accumulator = initial

    self.my_each do |element|
      if accumulator.nil?
        accumulator = element
      else
        accumulator = yield accumulator, element
      end
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self do
      yield element
    end

    self
  end
end
