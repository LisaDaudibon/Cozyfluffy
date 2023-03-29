Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_STRIPE_KEY'],
  :secret_key      => ENV['SECRET_STRIPE_KEY']
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]