class ControllerFile < ProtoFile
  def self.directory
    Pathname.new Rails.root.join('protoror/app/controllers')
  end

  def self.path_suffix
    '_controller.rb'
  end

  def self.route_name
    'controllers'
  end
end

