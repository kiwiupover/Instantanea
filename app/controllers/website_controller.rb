class WebsiteController < ApplicationController
  before_filter :find_by_id, :only => [:show, :new, :create, :update, :destroy]
  
  def index 
    @websites = Website.all
  end

  def show

  end

  def new 
    
  end

  def edit
    
  end

  def create 
    
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

