class CabinetsController < ApplicationController
  def index
    @cabinets = Cabinet.all
    @title = "Cabinets"
  end

  def show
    @cabinet = Cabinet.find(params[:id])
    @title = @cabinet.name
  end

  def new
    @cabinet = Cabinet.new
    @title = "New Cabinet"
  end

  def create
    @cabinet = Cabinet.new(params[:cabinet])
    if @cabinet.save
      flash[:success] = "Cabinet created."
      redirect_to @cabinet
    else
      @title = "New Cabinet"
      render :action => 'new'
    end
  end

  def edit
    @cabinet = Cabinet.find(params[:id])
    @title = "Editing #{@cabinet.name}"
  end

  def update
    @cabinet = Cabinet.find(params[:id])
    if @cabinet.update_attributes(params[:cabinet])
      flash[:success] = "Cabinet updated."
      redirect_to @cabinet
    else
      @title = "Editing #{@cabinet.name}"
      render :action => 'edit'
    end
  end

  def destroy
    @cabinet = Cabinet.find(params[:id])
    @cabinet.destroy
    flash[:success] = "Deleted cabinet: #{@cabinet.name}"
    redirect_to cabinets_path
  end

end
