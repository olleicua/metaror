module ApplicationHelper
  def files_path
    send("#{@model.route_name.pluralize}_path")
  end

  def file_path(file)
    send("#{file.route_name.singularize}_path", file.id)
  end

  def new_file_path
    send("new_#{@model.route_name.singularize}_path")
  end

  def edit_file_path(file)
    send("edit_#{file.route_name.singularize}_path", file.id)
  end
end
