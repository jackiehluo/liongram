class Order
  include Mongoid::Document
  field :buyer_name, type: String
  field :buyer_email, type: String
  field :recipient_name, type: String
  field :recipient_address, type: String
  field :date, type: Date
  field :number, type: Integer
  field :order_details, type: String
  field :message, type: String
  field :anonymous, type: Mongoid::Boolean
  field :venmo_username, type: String
end
