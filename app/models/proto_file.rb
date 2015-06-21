class ProtoFile
  attr_reader :path

  def initialize(options)
    if !options[:path].nil? and !options[:id].nil?
      raise ArgumentError,
            'ProtoFile cannot be specified with both a path and an id'
    elsif options[:path]
      @path = Pathname.new options[:path]
    elsif options[:id]
      id = options[:id].downcase.underscore
      @path = directory.join("#{id}#{path_suffix}")
    else
        raise ArgumentError,
              'ProtoFile cannot be specified without a path or an id'
    end
  end

  def self.all
    directory.find.map do |name|
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
    path.relative_path_from(self.class.directory).to_path
  end

  def id
    name.sub /#{path_suffix}$/, ''
  end

  def persisted?
    path.file?
  end

  def contents
    if persisted?
      @contents ||= path.read
    else
      ''
    end
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
    if !persisted?
      path.dirname.mkdir
    end
    path.write(contents)
  end
end
