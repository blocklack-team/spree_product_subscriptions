AddSubscribedFieldInCartListing = Deface::Override.new(
  virtual_path: "spree/orders/_line_item",
  name: "add_subscribed_field_to_cart_listing",
  insert_bottom: ".line-item",
  partial: "spree/orders/subscription_field"
)

EditSubscribedFieldInCartListing = Deface::Override.new(
  virtual_path: "spree/orders/_form",
  name: "edit_header_in_cart_listing",
  insert_bottom: "[data-hook='cart_items_headers']",
  partial: "spree/orders/cart_subscription_header"
)

EditFooterdInCartListing = Deface::Override.new(
  virtual_path: "spree/orders/_form",
  name: "edit_footer_in_cart_listing",
  insert_bottom: ".cart-total",
  partial: "spree/orders/cart_subscription_footer"
)
