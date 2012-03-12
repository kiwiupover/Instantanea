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
  
  def edit
    
  end
  
  def update
    @page = Page.find(params[:pages_id])
    @page_instance = PageInstance.find(@page.id).last
    doc = Nokogiri::HTML(open("#{@page.url}"))
    html = doc.to_html 
    md5 = Digest::MD5.hexdigest(html)
    if md5 != @page_instance.md5
      Delayed::Job.enqueue CreatePageInstance.new(self.id)
    end
    # viste the website path
    # make copy of the html and md5 hash it
    # if the md5 hash is different start the page instance process 
  end
   
private 
  def find_website 
    @website = Website.find(params[:website_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Website you were looking for could not be found."
    redirect_to root_path
  end
end
