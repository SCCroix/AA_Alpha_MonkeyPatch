require "byebug"
# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.reduce(&:+) / self.length.to_f
  end

  def median
    #debugger
    return nil if self.empty?
    len = self.length
    arr = self.sort
    if len.odd?
      return arr[len / 2]
    else
      average = (arr[len / 2 - 1] + arr[len / 2]) / 2.0
      return average
    end
  end

  def counts
    count = Hash.new(0)
    self.each do |el|
      if count[el]
        count[el] += 1
      end
    end
    return count
  end

  def my_count(item)
    count = 0
    self.each do |el|
      if item == el
        count += 1
      end
    end
    return count
  end

  def my_index(item)
    #debugger
    self.each_with_index do |el, idx|
      if el == item
        return idx
      end
    end
    return nil
  end

  def my_uniq
    seen = []
    self.each do |el|
      seen << el unless seen.include?(el)
    end
    return seen
  end

  def my_transpose
    #debugger
    new_arr = []

    (0...self.length).each do |row_idx|
      new_row = []
      (0...self.length).each do |col_idx|
        new_row << self[col_idx][row_idx]
      end
      new_arr << new_row
    end

    return new_arr
  end
end
