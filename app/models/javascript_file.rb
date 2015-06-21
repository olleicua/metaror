class JavascriptFile < ProtoFile
  def self.directory
    Pathname.new Rails.root.join('protoror/app/assets/javascripts')
  end

  def self.path_suffix
    '.js'
  end

  def self.route_name
    'javascripts'
  end
end
