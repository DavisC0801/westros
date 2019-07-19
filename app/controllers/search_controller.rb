class SearchController < ApplicationController
  def index

  end

  def show
    render locals:{
      facade: SearchShowFacade.new(params[:house])
    }
  end
end
