class FoldersController < ApplicationController
  def show
    @folder = Folder.find(params[:id])
    @title = @folder.name
  end

  def new
    @folder = Folder.new
    @cabinets = Cabinet.all
    @cabinet = Cabinet.find(params[:cabinet_id])
    @title = "New Folder"
  end

  def create
    @folder = Folder.new(params[:folder])
    @folder.cabinet = Cabinet.find(params[:folder][:cabinet_id])
    if @folder.save
      flash[:success] = "Folder created."
      redirect_to cabinet_path(@folder.cabinet)
    else
      @cabinets = Cabinet.all
      @title = "New Folder"
      render :action => 'new'
    end
  end

  def edit
    @folder = Folder.find(params[:id])
    @title = "Editing #{@folder.name}"
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update_attributes(params[:folder])
      flash[:success] = "Folder updated."
      redirect_to @folder
    else
      @title = "Editing #{@folder.name}"
      render :action => 'edit'
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    flash[:success] = "Deleted folder: #{@folder.name}"
    redirect_to cabinet_path(@folder.cabinet)
  end

end
