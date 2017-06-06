if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_bYZbWrMPdWp5NMbRfXV24XwN',
    :secret_key => 'sk_test_n6QWA4pZWV2NcIch9THoMjsT'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]