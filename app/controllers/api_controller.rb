class ApiController < ApplicationController

  def seasons
    respond_to do |format|
      format.json { render {} }
    end
  end
end
