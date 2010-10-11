class RevisionsController < ApplicationController
  def download
    @revision = Revision.find(params[:id])
    send_data @revision.data, :filename => 'download', :type => @revision.content_type
  end
  
  def destroy
  end
end
