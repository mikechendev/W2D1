# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    #PART 1
  
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum.to_f / self.count
    end

    def median
        return nil if self.empty?
        if self.count.odd?
            mid_idx = self.count / 2
            self.sort[mid_idx]
        else
            half = self.count / 2
            (self.sort[half] + self.sort[half - 1]).to_f / 2
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |el| hash[el] += 1}
        hash
    end

    #PART 2

    def my_count(arg)
        self.counts[arg]
    end

    def my_index(arg)
        self.each_with_index { |el, i| return i if el == arg }
        nil
    end

    def my_uniq
        self.counts.keys
    end

    def my_transpose
        arr = self.dup
        (0...arr.count - 1).each do |i|
            (i...arr.count).each do |j|
                arr[i][j], arr[j][i] = arr[j][i], arr[i][j]
            end
        end
        arr
    end

end
