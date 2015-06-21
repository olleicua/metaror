class StylesheetsController < FilesController
  def setup
    @section = 'Stylesheet'
    @model = StylesheetFile
  end
end
