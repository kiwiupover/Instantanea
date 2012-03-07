class CreatePagesDetails < Struct.new(:id) 
  def perform
    page = Page.find(id)
    doc = Nokogiri::HTML(open("#{page.url}"))
    page.title = doc.title
    page.save
  end
end