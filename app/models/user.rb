class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_many :orders

  before_create :confirmation_token

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :confirmed, type: Boolean
  field :confirm_token, type: String
  field :approved, type: Boolean
  field :admin, type: Boolean

  has_secure_password
  validates_presence_of :name, :email, :password
  validates :email, :uniqueness => true
  validates :password, :length => {
    :minimum => 6,
    :maximum => 20,
    :too_short => "Passwords must be at least %{count} characters.",
    :too_long => "Passwords must be at most %{count} characters."
  }

  def email_activate
    self.confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
