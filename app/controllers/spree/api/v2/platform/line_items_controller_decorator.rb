# app/controllers/spree/api/v2/platform/line_items_controller_decorator.rb

module Spree
  module Api
    module V2
      module Platform
        module LineItemsControllerDecorator
          def self.prepended(base)
            base.class_eval do
              def create
                super # Llama al método create del controlador original
                # Agrega aquí la lógica adicional si es necesario

                line_item = spree_current_order.line_items.last
                line_item.subscribe = 1
                line_item.delivery_number = 1
                line_item.subscription_frequency_id = 1
                line_item.save!
              end
            end
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Platform::LineItemsController.prepend(Spree::Api::V2::Platform::LineItemsControllerDecorator)

