class PagesController < ApplicationController
  before_filter :find_website
  
  def new
    @page = Page.new
  end 
  
  def show
    @page = Page.find(params[:id])
  end
  
  def create
    @page = @website.pages.create(params[:page])
    if @page.save!
      Delayed::Job.enqueue CreatePageInstances.new(@page.id)  
      redirect_to @page, notice: 'The page was successfully created.' 
    else
      flash[:notice] = "Page was not created"
      render "new"
    end
  end 
private 
  def find_website 
    @website = Website.find(params[:website_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Website you were looking for could not be found."
    redirect_to root_path
  end
end
