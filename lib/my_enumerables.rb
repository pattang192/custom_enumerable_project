module Enumerable
  # Your code goes here
  def my_all?
    my_each do |elem|
      return false if yield(elem) == false
    end
    true
  end

  def my_any?
    my_each { |elem| return true if yield(elem) }
    false
  end

  def my_count
    counter = 0
    if block_given? 
      my_each do |elem|
        counter += 1 if yield(elem) == true
      end
    else
      counter = self.length
    end
    counter
  end

  def my_each_with_index
    index = 0
    my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_inject(initial_value)
    accumulator = initial_value
    my_each do |elem|
      accumulator = yield(accumulator, elem)
    end
    accumulator
  end

  def my_map
    new_array = []
    my_each do |elem|
     new_array << yield(elem)
    end
    new_array
  end

  def my_none?
    my_each { |elem| return false if yield(elem) }
    true
  end

  def my_select
    new_array = []
    my_each { |elem| new_array << elem if yield(elem) }
    new_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
  end
end
