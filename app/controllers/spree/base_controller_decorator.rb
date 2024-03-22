module Spree::BaseControllerDecorator.class_eval do
  add_flash_types :success, :error
end

::Spree::BaseController.prepend(Spree::BaseControllerDecorator)