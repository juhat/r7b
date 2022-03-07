# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :app_name, default: "R4B", validates: {presence: true, length: {in: 2..20}}
  field :host, default: "http://example.com"
  field :registration_allowed, type: :boolean, default: true
  field :invitation_allowed, type: :boolean, default: true
  field :maximum_invitation, type: :integer

  field :restrict_access_to_allowed_email_addresses, type: :boolean, default: false
  field :allowed_email_addresses, type: :array, separator: /[\n,]/

  field :language_setting_allowed, type: :boolean, default: true

  # field :default_locale, default: "zh-CN", validates: { presence: true, inclusion: { in: %w[zh-CN en jp] } }, option_values: %w[en zh-CN jp], help_text: "Bla bla ..."
  # field :admin_emails, type: :array, default: %w[admin@rubyonrails.org]
  #
  # # lambda default value
  # field :welcome_message, type: :string, default: -> { "welcome to #{self.app_name}" }, validates: { length: { maximum: 255 } }
  # # Override array separator, default: /[\n,]/ split with \n or comma.
  # field :tips, type: :array, separator: /[\n]+/
  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
