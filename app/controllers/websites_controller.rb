class WebsitesController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]
  
  def index 
    @websites = Website.all
  end

  def show
  end

  def new 
    @website = Website.new
  end

  def edit
  end

  def create
   @website = Website.create!(params[:website])  
   if @website.save
     Delayed::Job.enqueue CreatePages.new(@website.id, @website.site_map.url) 
     redirect_to website_path(@website), :notice => "Website was created."
   else
     flash[:notice] = "Website was not created."
     render "new"
   end 
  end 
  
  def update
  end

  def destroy
  end
      

private
  def find_by_id
    @website = Website.find(params[:id])
  end
  
  
end  

