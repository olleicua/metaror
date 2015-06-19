class ModelFile < ProtoFile
  def self.directory
    Pathname.new Rails.root.join('protoror/app/models')
  end

  def self.path_suffix
    '.rb'
  end

  def self.route_name
    'models'
  end
end
