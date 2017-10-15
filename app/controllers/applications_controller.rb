class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]

    if @application.save
      flash[:notice] = "Application info saved!"
      redirect_to @application
    else
      flash.now[:alert] = "An error occured. Try saving again."
      render :new
    end
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was de-registered successfully."
      redirect_to applications_path
    else
      flash.now[:alert] = "There was an error de-registering the application. Try again."
      render :show
    end
  end

  def edit
  end
end
