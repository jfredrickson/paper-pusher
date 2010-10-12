class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    @title = @document.name
  end

  def new
    @document = Document.new
    revision = @document.revisions.build
    revision.note = "First revision"
    @document.folder = Folder.find(params[:folder_id])
    @title = "New Document"
  end

  def create
    @document = Document.new(params[:document])
    @document.folder = Folder.find(params[:document][:folder_id])
    if @document.save
      flash[:success] = "Document created."
      redirect_to folder_path(@document.folder)
    else
      @title = "New Document"
      render :action => :new
    end
  end

  def edit
    @document = Document.find(params[:id])
    @title = "Editing #{@document.name}"
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:success] = "Document updated."
      redirect_to @document
    else
      @title = "Editing #{@document.name}"
      render :action => 'edit'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success] = "Deleted document: #{@document.name}"
    redirect_to folder_path(@document.folder)
  end

end
