class User < Sequel::Model
  def validate
    super
    validates_format(URI::MailTo::EMAIL_REGEXP, :email)
    validates_presence(:email)
    validates_unique(:email) if errors.empty?
  end
end
