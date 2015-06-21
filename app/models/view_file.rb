class ViewFile < ProtoFile
  def self.directory
    Pathname.new Rails.root.join('protoror/app/views')
  end

  def self.path_suffix
    '.html.erb'
  end

  def self.route_name
    'views'
  end
end
