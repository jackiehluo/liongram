class Order
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  belongs_to :user

  field :buyer_name, type: String
  field :buyer_email, type: String
  field :recipient_name, type: String
  field :recipient_address, type: String
  field :date, type: Date
  field :items, type: String
  field :message, type: String
  field :anonymous, type: Boolean
  field :venmo_username, type: String
end
