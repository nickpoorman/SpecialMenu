class User
  include Mongoid::Document

  # document fields
  field :email, :type => String

  # simple password authentication portion
  field :crypted_password, :type => String
  field :salt, :type => String

  # remember me portion
  field :remember_me_token, :type => String
  field :remember_me_token_expires_at, :type => DateTime

  index :remember_me_token, background: true

  # user activation portion
  field :activation_state, :type => String
  field :activation_token, :type => String
  field :activation_token_expires_at, :type => DateTime

  index :activation_token, background: true

  # Activity logging portion
  field :last_login_at, :type => DateTime
  field :last_logout_at, :type => DateTime
  field :last_activity_at, :type => DateTime

  index :last_logout_at, background: true
  index :last_activity_at, background: true

  # Brute force protection
  field :failed_logins_count, :type => Integer
  field :lock_expires_at, :type => DateTime

  # other document stuff
  attr_accessible :email, :password, :password_confirmation

  authenticates_with_sorcery!

  validates_length_of :password, :minimum => 5, :message => "password must be at least 5 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :vendors

end
