#@author Ming Chen, ming.chen@amaysim.com.au

class CmsMessage < CmsDb
  set_table_name 'field_data_field_msg_content'
  def self.load(id, options = {})
     Rails.logger.debug " #{self.all.inspect}"
    #select fmc.field_msg_content_value
    #from field_data_field_msg_content fmc, field_data_field_msg_id fmi, field_data_field_msg_type fmt
    #where fmc.entity_type = 'node' and fmc.bundle = 'message' and
    #fmc.deleted = 0 and fmi.field_msg_id_value = 2 and fmt.field_msg_type_value = 'thank_you'
    #and fmc.entity_id = fmi.entity_id and fmi.entity_id = fmt.entity_id
    #and fmc.revision_id = fmi.revision_id and fmi.revision_id = fmt.revision_id;

  end
end