# Loads the default configuration file located under RAILS_ROOT/config/constants.yml
# Change the default location by modifying the following line:
AppConstants.config_path = "#{Rails.root}/config/constants.yml"
AppConstants.load!

require 'yaml'

CMS_IMAGES = YAML.load_file(File.join(Rails.root.to_s, 'config', 'images.yml'))
Rails.logger.debug "CMS_IMAGES: #{CMS_IMAGES.inspect}"

cms_db_file = File.join(Rails.root.to_s, "config", "cms_database.yml")
CMS_DB = YAML.load_file(cms_db_file)[Rails.env].symbolize_keys
Rails.logger.debug "CMS_DB: #{CMS_DB.inspect}"

CMS_PAGES = YAML.load_file( File.join(Rails.root.to_s, 'config', 'cms_pages.yml') ).symbolize_keys
Rails.logger.debug "CMS_PAGES: #{CMS_PAGES.inspect}"

