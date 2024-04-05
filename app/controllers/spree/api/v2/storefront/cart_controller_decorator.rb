module Spree
  module Api
    module V2
      module Storefront
        module CartControllerDecorator
          def self.prepended(base)
            base.class_eval do

            end
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::CartController.prepend(Spree::Api::V2::Storefront::CartControllerDecorator)
