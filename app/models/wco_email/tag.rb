
class WcoEmail::Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :slug
  # index
  # validate presence
  # validate uniqueness ?

  # parent-child

  has_and_belongs_to_many :email_conversations, class_name: 'Wco::EmailConversation'

end
