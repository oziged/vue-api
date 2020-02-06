module NestedHandler
  def get_nested_checkpoints
    def get_nested (parent)
      children = parent.checkpoints
      nested_array = []
      children.each { |item| 
        place = Place.find(item.place_id)
        
        nested_array.push({
          id: item.id,
          title: item.title,
          description: item.description,
          places: get_child_places(item),
          place: {
            lat: place.lat,
            lng: place.lng
          },
          nested: get_nested(item)
        })
      }

      nested_array
    end
    return get_nested(self)
  end

  def get_child_places(item)
    item.checkpoints.map{ |checkpoint| 
      place = Place.find(checkpoint.place_id)
      {
        lat: place.lat,
        lng: place.lng
      }
    }
  end

end