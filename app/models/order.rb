class Order
  include Mongoid::Document
  belongs_to :user

  field :buyer_name, type: String
  field :buyer_email, type: String
  field :recipient_name, type: String
  field :recipient_address, type: String
  field :date, type: Date
  field :number, type: Integer
  field :items, type: String
  field :message, type: String
  field :anonymous, type: Boolean
  field :venmo_username, type: String
end
