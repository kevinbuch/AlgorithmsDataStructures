class BubbleSort
  attr_accessor :list

  def initialize(list)
    self.list = list
    self.movement_index = 0
    self.loop_index = list.size - 1
  end

  def tick
    done = false
    movement_index.upto(list.size - 1) do |index|
      next if done
      left = list[index]
      right = list[index + 1]
      if right
        if left > right
          list[index] = right
          list[index + 1] = left
          done = true
          self.movement_index = index + 1
          if @movement_index == @loop_index
            self.movement_index = 0
            @loop_index -= 1
          end
        end
      end
    end
  end

  private

  attr_accessor :loop_index, :movement_index
end
