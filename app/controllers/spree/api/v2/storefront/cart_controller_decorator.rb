module Spree
  module Api
    module V2
      module Storefront
        module CartControllerDecorator
          def self.prepended(base)
            base.class_eval do
              def add_item
                spree_authorize! :update, spree_current_order, order_token
                spree_authorize! :show, @variant

                result = add_item_service.call(
                  order: spree_current_order,
                  variant: @variant,
                  quantity: add_item_params[:quantity],
                  public_metadata: add_item_params[:public_metadata],
                  private_metadata: add_item_params[:private_metadata],
                  options: add_item_params[:options],
                  subscribe: params[:subscribe],
                  delivery_number: params[:delivery_number],
                  subscription_frequency_id: params[:subscription_frequency_id]
                )

                render_order(result)
              end
            end
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::CartController.prepend(Spree::Api::V2::Storefront::CartControllerDecorator)
