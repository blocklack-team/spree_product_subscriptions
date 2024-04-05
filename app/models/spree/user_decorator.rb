module Spree
  module UserDecorator
    def self.prepended(base)
      base.class_eval do
        alias_method :shipping_address, :ship_address
      end
    end
  end
end

Spree.user_class.prepend(Spree::UserDecorator)
