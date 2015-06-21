class StylesheetFile < ProtoFile
  def self.directory
    Pathname.new Rails.root.join('protoror/app/assets/stylesheets')
  end

  def self.path_suffix
    '.css'
  end

  def self.route_name
    'stylesheets'
  end
end
