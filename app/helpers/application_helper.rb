module ApplicationHelper
  def file_path(file)
    send("#{file.route_name.singularize}_path", file.id)
  end

  def edit_file_path(file)
    send("edit_#{file.route_name.singularize}_path", file.id)
  end
end
