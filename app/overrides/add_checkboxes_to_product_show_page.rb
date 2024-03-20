# app/overrides/add_checkboxes_to_cart_form.rb
Deface::Override.new(
  virtual_path: "spree/products/_cart_form",
  name: "add_checkboxes_to_cart_form",
  insert_before: "[data-hook='inside_product_cart_form']",
  partial: "spree/products/cart_checkboxes"
)
