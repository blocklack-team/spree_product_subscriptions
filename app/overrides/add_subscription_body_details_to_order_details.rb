AddSubscriptionBodyDetailsToOrderDetails = Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: "add_subscription_body_to_order_details",
  insert_bottom: "[data-hook='order_details_line_item_row']",
  partial: "spree/shared/subscription_field"
)
