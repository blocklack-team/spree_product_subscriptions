EditSubscribedFieldInCartListing = Deface::Override.new(
  virtual_path: "spree/orders/_form",
  name: "edit_header_in_cart_listing",
  insert_bottom: "[data-hook='cart_items_headers']",
  partial: "spree/orders/cart_subscription_header"
)
