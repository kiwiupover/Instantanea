class PageInstancesController < ApplicationController
  before_filter :find_website_page 
  
  def new
    @page_instance = PageInstance.new
  end

  def create
    @page_instance = @page.page_instance.create!(params[:page_instance])
    if @page_instance.save
      redirect_to @page, notice: 'The page instance was successfully created.' 
    else
      flash[:notice] = "Page instance was not created"
      render "new"
    end 
  end

private
  def find_website_page 
    @page = Page.find(params[:pages_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Website you were looking for could not be found."
    redirect_to root_path
  end
end
