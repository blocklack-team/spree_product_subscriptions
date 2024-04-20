AddSubscriptionDetailsToOrderDetails = Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: "add_subscription_header_to_order_details",
  insert_bottom: '[data-hook="order_details_line_items_headers"]',
  partial: "spree/orders/cart_subscription_header"
)
