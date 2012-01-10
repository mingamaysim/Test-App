module ApplicationHelper
  #Loads common assets from CMS
  def ama_include_cms_assets
    tags = ''
    cms_host = 'http://amasydev1/'
    AppConstants.cms.styles.each_value do |css|
      tags = "#{tags} #{stylesheet_link_tag cms_host + css}\n"
    end
    AppConstants.cms.js.each_value do |js|
      tags = "#{tags} #{javascript_include_tag cms_host + js}\n"
    end
    tags.html_safe
  end
end
