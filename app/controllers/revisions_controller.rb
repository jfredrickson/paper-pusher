class RevisionsController < ApplicationController
  def download
    @revision = Revision.find(params[:id])
    send_data @revision.data, :filename => 'download', :type => @revision.content_type
  end
  
  def new
    @revision = Revision.new
    @revision.document = Document.find(params[:document_id])
    @title = "New Revision"
  end
  
  def create
    @revision = Revision.new(params[:revision])
    @revision.document = Document.find(params[:revision][:document_id])
    if @revision.save
      flash[:success] = "Revision created."
      redirect_to @revision.document
    else
      @title = "New Revision"
      render :action => :new
    end
  end
  
  def destroy
  end
end
