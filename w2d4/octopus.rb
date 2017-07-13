class Octopus

  def sluggish_octopus(arr) # O(n^2)
    biggest_fish = nil
    arr.each do |fish1|
      arr.each do |fish2|
        biggest_fish = fish1 if fish1 > fish
      end
    end
    biggest_fish
  end

  def dominant_octopus(arr) # O(n log n)
    sorted_fish = arr.merge_sort #assumes merge_sort implemented
    sorted_fish.last
  end

  def clever_octopus(arr) # O(n)
    biggest_fish = arr.first
    arr.each { |fish| biggest_fish = fish if fish > biggest_fish }
    biggest_fish
  end

  def slow_dance(direction, tiles_arr) # O(n)
    tiles_arr.each_with_index { |move, i| return i if move == direction }
  end

  def constant_dance(direction, tiles_hash) # O(1)
    tiles_hash[direction] #assumes hash created
  end

end #Octopus
