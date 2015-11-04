
P116
app/helpers/application_helper.rb
4.2
module ApplicationHelper
#
def full_title(page_title = '')
base_title = "Ruby on Rails Tutorial Sample App"
if page_title.empty?
base_title
else
"#{page_title} | #{base_title}"