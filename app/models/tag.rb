class Tag 

  attr_accessor :name, :pass, :fail, :error

  def as_json(options = {})
    { :label => name, :values => [pass, fail, error] }
  end

end