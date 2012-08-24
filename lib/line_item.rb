class LineItem
  attr_accessor :id, :item, :position
  def initialize(id, item, position)
    @id = id
    @item = item
    @position = position
  end
end
