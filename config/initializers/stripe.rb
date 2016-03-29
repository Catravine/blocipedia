# Production or test:
if Rails.env == 'production'
  Rails.configuration.stripe = {
    :publishable_key => ENV['stripe_live_publishable_key'],
    :secret_key      => ENV['stripe_live_secret_key']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ENV['stripe_test_publishable_key'],
    :secret_key      => ENV['stripe_test_secret_key']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
