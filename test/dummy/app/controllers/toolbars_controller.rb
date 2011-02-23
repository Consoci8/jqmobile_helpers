class ToolbarsController < ApplicationController

  # GET /toolbars
  # GET /toolbars.xml
  def index
    @toolbars = Toolbar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @toolbars }
    end
  end

 

end
