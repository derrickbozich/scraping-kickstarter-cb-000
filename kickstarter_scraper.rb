# require libraries/modules here
require 'nokogiri'
require 'pry'





def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  kickstarter.css("li.project.grid_4")

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("span.location-name").text,
      :percent_funded => project.css("li.first.funded strong").text.gsub("%", "").to_i
    }
  end

  projects


end


# create_project_hash
# binding.pry
# 
# <p class="bbcard_blurb">
# Four young composers join forces with an indie orchestra to present this musical reflection on a literary masterpiece.
# </p>

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("span.location-name").text
# percent_funded: project.css("li.first.funded strong").text.gsub("%", "").to_i
