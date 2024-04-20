EditFooterInCartListing = Deface::Override.new(
  virtual_path: "spree/orders/_form",
  name: "edit_footer_in_cart_listing",
  insert_bottom: ".cart-total",
  partial: "spree/orders/cart_subscription_footer"
)
