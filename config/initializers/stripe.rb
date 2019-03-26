if Rails.env.production?
  publishable_key = "pk_test_tNhFWwtsG7rjCOzowFlkRYvq"
  secret_key      = "sk_test_jqwdIAlbTpMXzjyAqsg9cU0t"
else
  publishable_key = "pk_test_tNhFWwtsG7rjCOzowFlkRYvq"
  secret_key      = "sk_test_jqwdIAlbTpMXzjyAqsg9cU0t"
end

Rails.configuration.stripe = {
  :publishable_key => publishable_key,
  :secret_key      => secret_key
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
