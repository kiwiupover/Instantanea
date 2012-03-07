class Page < ActiveRecord::Base
  belongs_to :website
  has_many :page_instances 
  
  after_create :add_html, :create_page_instance
  
  def add_html
    Delayed::Job.enqueue CreatePagesDetails.new(self.id)
  end
  
  def create_page_instance
    Delayed::Job.enqueue CreatePageInstance.new(self.id)
  end
end
