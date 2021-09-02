# Set up stripe API keys
Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)