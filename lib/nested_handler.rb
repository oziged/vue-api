module NestedHandler
  def get_nested_checkpoints
    def get_nested (parent)
      children = parent.checkpoints
      nested_array = []
      children.each { |item| 
        nested_array.push({
          id: item.id,
          title: item.title,
          description: item.description,
          nested: get_nested(item)
        })
      }
      nested_array
    end
    return get_nested(self)
  end
end