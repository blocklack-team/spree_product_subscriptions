
AddSubscriptionFooterDetailsToOrderDetails = Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: "add_subscription_footer_to_order_details",
  insert_bottom: ".total",
  partial: "spree/orders/cart_subscription_footer"
)
