class DupeDetector

  def initialize(ary)
    @ary = ary
  end

  def dupes(attr=nil)
    if attr # Objects with an attribute.
      @ary.inject(Hash.new{ |k,v| k[v] = [] }){ |h,v| h[v.send(attr)] << v; h }.reject{ |k,v| v.size == 1 }.map{ |k,v| v}.flatten
    else
      @ary.inject({}){ |h,v| h[v] = h[v].to_i + 1; h }.reject{ |k,v| v == 1 }.keys
    end
  end

end
