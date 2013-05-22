Rails.configuration.stripe = {
  :publishable_key => "pk_test_UIyIaqTObAzqk1k7pp7HEO2u",
  :secret_key      => "sk_test_y1eVgaM9KqSFHy3lBqxT6WwW"
}

STRIPE_PUBLIC_KEY = Rails.configuration.stripe[:publishable_key]

Stripe.api_key = Rails.configuration.stripe[:secret_key]