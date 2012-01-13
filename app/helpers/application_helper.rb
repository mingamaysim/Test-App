#@author Ming Chen, ming.chen@amaysim.com.au

module ApplicationHelper
  #Load common assets from CMS
  def include_cms_assets
    tags = ''
    cms_host = 'http://amasydev1/' #TODO load from compass.yml
    AppConstants.cms.styles.each_value do |css|
      tags = "#{tags} #{stylesheet_link_tag cms_host + css}\n"
    end
    AppConstants.cms.js.each_value do |js|
      tags = "#{tags} #{javascript_include_tag cms_host + js}\n"
    end
    tags.html_safe
  end

  #Create an image tag using a CMS image
  def cms_image_tag(img_key, options = {})
    image_tag cms_image_url(img_key), options
  end

  def cms_image_url(img_key)
    cms_host = 'http://amasydev1/' #TODO load from compass.yml
    "#{cms_host}#{CMS_IMAGES[img_key]}"
  end
end
