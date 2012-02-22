class PagesController < ApplicationController
  
  def new
    @page = Page.new
  end 
  
  def show
    @page = Page.find(params[:id])
  end
  
  def create
    @page = Page.create(params[:page])
    if @page.save 
      redirect_to @page, notice: 'The page was successfully created.' 
    else
      flash[:notice] = "Page was not created"
      render "new"
    end
  end
end
