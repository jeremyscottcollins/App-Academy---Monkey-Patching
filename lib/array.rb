# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    self.max - self.min unless self == []
  end

  def average
   self.sum.to_f / self.length unless self == []
  end

  def median
    return nil if self.empty?

    mid_index = self.length / 2
    sorted = self.sort
    if self.length.odd?
      return sorted[mid_index]
    else
      return (sorted[mid_index - 1] + sorted[mid_index]) / 2.0
    end
  end

  def counts
    count = Hash.new(0)
    self.each do |ele|
        count[ele] += 1
    end
    count
  end

  def my_count(val)
    count = Hash.new(0)
    self.each do |ele|
        count[ele] += 1
    end
    count[val]
  end

  def my_index(val)
    self.each_with_index { |ele, i| return i if ele == val }
    nil
  end

  def my_uniq
    elements = {}
    self.each { |ele| elements[ele] = true}
    elements.keys
  end

  def my_transpose
    transposed = []
    self.each_with_index do |ele1, idx1|
        row = []
        self.each_with_index do |ele2, idx2|
            row << self[idx2][idx1]
        end
        transposed << row
    end
    transposed
  end

end