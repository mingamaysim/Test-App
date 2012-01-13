#@author Ming Chen, ming.chen@amaysim.com.au

class CmsDb < ActiveRecord::Base
    self.abstract_class = true
    establish_connection(
      :adapter  => CMS_DB[:adapter],
      :host     => CMS_DB[:host],
      :username => CMS_DB[:username],
      :password => CMS_DB[:password],
      :database => CMS_DB[:database]
    )
end