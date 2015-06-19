class FilesController < ApplicationController
  before_filter :setup
  before_filter :set_file, except: [:index, :new, :create]

  def index
    @files = @model.all
  end

  def edit
  end

  def update
    @file.update(file_params)
    redirect_to action: :index
  end

  private

  def set_file
    @file = @model.find(params[:id])
  end

  def file_params
    params.require(:file).permit(:contents)
  end
end
