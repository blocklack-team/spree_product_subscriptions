# app/controllers/spree/api/v2/platform/line_items_controller_decorator.rb

module Spree
  module Api
    module V2
      module Platform
        module LineItemsControllerDecorator

          def self.prepended(base)
            base.line_item_options += [:subscribe, :delivery_number, :subscription_frequency_id]
          end

        end
      end
    end
  end
end

::Spree::Api::V2::Platform::LineItemsController.prepend(Spree::Api::V2::Platform::LineItemsControllerDecorator)
