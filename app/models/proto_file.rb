class ProtoFile
  attr_reader :path

  def initialize(options)
    if !options[:path].nil? and !options[:id].nil?
      raise ArgumentError,
            'ProtoFile cannot be specified with both a path and an id'
    elsif options[:path]
      @path = Pathname.new options[:path]
    elsif options[:id]
      @path = directory.join("#{options[:id]}#{path_suffix}")
    else
        raise ArgumentError,
              'ProtoFile cannot be specified without a path or an id'
    end
  end

  def self.all
    directory.entries.map do |name|
      path = directory.join(name)
      if path.file? and path.fnmatch?("*#{path_suffix}")
        new(path: path)
      end
    end.compact
  end

  def self.find(id)
    file = new(id: id)
    if file.persisted?
      file
    else
      raise ActiveRecord::RecordNotFound, "Couldn\'t find #{self} with id=#{id}"
    end
  end

  def klass
    self.class
  end

  def directory
    klass.directory
  end

  def path_suffix
    klass.path_suffix
  end

  def route_name
    klass.route_name
  end

  def name
    @path.relative_path_from(self.class.directory).to_path
  end

  def id
    path.basename.to_path.sub /#{self.class.path_suffix}$/, ''
  end

  def persisted?
    @path.file?
  end

  def contents
    @contents ||= @path.read
  end

  def contents=(string)
    @contents = string
  end

  def update(attributes)
    attributes.each_pair do |key, value|
      send("#{key}=", value)
    end
    save
  end

  def save
    path.write(contents)
  end
end
