module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    my_each do |el|
      yield el, count
      count += 1
    end
  end

  def my_select
    result = []
    my_each { |el| result.push(el) if yield el }
    result
  end

  def my_all?
    my_each { |el| return false unless yield el }
    true
  end

  def my_any?
    my_each { |el| return true if yield el }
    false
  end

  def my_none?
    my_each { |el| return false if yield el }
    true
  end

  def my_count
    count = 0
    block = block_given? ? ->(el) { count += 1 if yield el } : ->(_el) { count += 1 }
    my_each(&block)
    count
  end

  def my_map
    result = []
    my_each { |el| result.push(yield el) }
    result
  end

  def my_inject(acc = 0)
    my_each { |el| acc = yield acc, el }
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self
      yield el
    end
  end
end
