class FilesController < ApplicationController
  before_filter :setup
  before_filter :set_file, except: [:index, :new, :create]

  def index
    @files = @model.all
  end

  def edit
  end

  def update
    @file.update(update_params)
    redirect_to action: :index
  end

  def new
  end

  def create
    @file = @model.new(create_params)
    if @file.persisted?
      flash[:error] =
        'A #{@section} with the name @{create_params[:id]} already exists'
      redirect_to action: :new
    else
      @file.save
      redirect_to action: :edit, id: @file.id
    end
  end

  private

  def set_file
    @file = @model.find(params[:id])
  end

  def create_params
    params.require(:file).permit(:id)
  end

  def update_params
    params.require(:file).permit(:contents)
  end
end
