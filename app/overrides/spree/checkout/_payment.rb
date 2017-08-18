Deface::Override.new(
  virtual_path: 'spree/checkout/_payment',
  name: 'Modifies Paypal Express payment method on checkout',
  surround: 'erb[loud]:contains("Spree.t(method.name, :scope => :payment_methods, :default => method.name)")',
  text: %{
    <% if method.is_a?(Spree::Gateway::BraintreeVzeroPaypalExpress) %>
      <img src="https://www.paypalobjects.com/webstatic/mktg/logo/pp_cc_mark_37x23.jpg" border="0" alt="PayPal Logo">
      <%= render_original %>
    <% end %>
  }
)

Deface::Override.new(
  virtual_path: 'spree/checkout/_payment',
  name: 'Adds necessary buttons for Braintree payment methods',
  insert_after: 'erb[loud]:contains("submit_tag")',
  partial: 'spree/checkout/payment/braintree_vzero/buttons'
)
