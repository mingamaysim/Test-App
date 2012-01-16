#@author Ming Chen, ming.chen@amaysim.com.au

#This model corresponds to CMS message
class CmsMessage < CmsDb
  set_table_name 'field_data_field_msg_content'
  #PK: entity_type, entity_id, deleted, delta, language

  TYPE_THANK_YOU = 'thank_you'
  TYPE_SIM = 'sim'
  TYPE_ERROR = 'error'
  TYPE_PROMO = 'promo'
  TYPE_ALERT = 'alert'

  def self.load(id, type, options = {})
    #select fmc.field_msg_content_value
    #from field_data_field_msg_content fmc, field_data_field_msg_id fmi, field_data_field_msg_type fmt
    #where fmc.entity_type = 'node' and fmc.bundle = 'message' and
    #fmc.deleted = 0 and fmi.field_msg_id_value = 2 and fmt.field_msg_type_value = 'thank_you'
    #and fmc.entity_id = fmi.entity_id and fmi.entity_id = fmt.entity_id
    #and fmc.revision_id = fmi.revision_id and fmi.revision_id = fmt.revision_id;
    #Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
    records = CmsMessage.joins("INNER JOIN field_data_field_msg_id fmi on field_data_field_msg_content.entity_id = fmi.entity_id AND field_data_field_msg_content.revision_id = fmi.revision_id
    INNER JOIN field_data_field_msg_type fmt on fmi.entity_id = fmt.entity_id AND fmi.revision_id = fmt.revision_id").where("field_data_field_msg_content.bundle = ? AND field_data_field_msg_content.entity_type = ? AND
    field_data_field_msg_content.deleted = ? AND fmi.field_msg_id_value = ? AND fmt.field_msg_type_value = ?", 'message', 'node', 0, id, type)
    Rails.logger.debug "CMS message retrieved: #{records.inspect}"
    records[0].field_msg_content_value.html_safe #TODO add encoding conversion and erbify
  end
end