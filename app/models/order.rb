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
  field :paid, type: Boolean, default: false
  field :delivered, type: Boolean, default: false
  field :created_at, type: DateTime, default: ->{ Time.now }
  field :delivered_at, type: DateTime

  def confirm_payment
    self.paid = true
    save!(:validate => false)
  end

  def confirm_delivery
    self.delivered = true
    self.delivered_at = Time.now
    save!(:validate => false)
  end
end
