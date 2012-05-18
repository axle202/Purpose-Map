module OrganizationsHelper

  def google_maps_with_neighbors(organization)
    my_pins = [[ 'red', [organization] ], [ 'blue', organization.nearbys(5) ]]
    "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=12&#{markers(my_pins)}"
  end

  def pin(location)
    "#{location.latitude},#{location.longitude}"
  end
  
  def pins(locations)
    locations.map { |location|
      pin(location)
    }.join '|'
  end
  
  def marker(color, locations)
    "markers=color:#{color}|#{pins(locations)}"
  end
  
  def markers(markers)
    markers.map { |color,locations|
      marker(color, locations)
    }.join '&'
  end
  
end
