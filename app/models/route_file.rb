class RouteFile < ProtoFile
  def self.directory
    Pathname.new Rails.root.join('protoror/config')
  end

  def self.path_suffix
    '.rb'
  end

  def self.route_name
    'routes'
  end

  def self.file
    find('routes')
  end

  def self.all
    [file]
  end
end