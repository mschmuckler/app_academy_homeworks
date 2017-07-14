class LRUCache
  def initialize(max)
    @cache = []
    @max = max
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      renew(el)
    elsif maxed_out?
      eject_then_add(el)
    else
      @cache << el
    end
  end

  def show
   p @cache
  end

  private

  def maxed_out?
    @cache.count >= @max
  end

  def eject_then_add(el)
    @cache.shift
    @cache << el
  end

  def renew(el)
    idx = @cache.index(el)
    @cache.delete_at(idx)
    @cache << el
  end

end #class
