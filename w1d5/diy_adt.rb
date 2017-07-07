class Stack
  def initialize(stack = [])
    @stack = stack
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    @stack.shift(el)
  end

  def dequeue
    @stack.pop
  end

  def show
    @stack
  end
end

class Map
  def initialize(map = [])
    @map = map
  end

  def assign(key, value)
    if lookup(key)
      @map.each { |pair| pair[1] = value if pair[0] == key }
    else
      @map << [key, value]
    end
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end
end
