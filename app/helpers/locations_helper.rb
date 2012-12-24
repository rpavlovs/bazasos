module LocationsHelper
  def format_address(location)
    [location.region, location.city, location.postal_code, location.street,
     location.street_number, location.building_number, location.appartment,
     location.entrance, location.floor].delete_if(&:blank?).join(', ')
  end
end
