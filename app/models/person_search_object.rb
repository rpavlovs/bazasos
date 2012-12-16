class PersonSearchObject
  attr_accessor :family_name, :given_name, :middle_name, :phone_number
  def initialize(params = {})
    #TODO sanitize params
    #TODO move search logic to model
    params.each do |key, value|
      self.send("#{key}=", value) if self.respond_to?("#{key}=")
    end
  end
end
