module Spree::BaseControllerDecorator
  def self.prepended(base)
    base.class_eval do
      add_flash_types :success, :error
    end
  end
end

::Spree::BaseController.prepend(Spree::BaseControllerDecorator)
