module Spree
	module Api
		module V2
			module Storefront
				module CartControllerDecorator
          def self.prepended(base)
            def add_item
              p 'Line Items decorator'
							p 'Line Items decorator'
							p 'Line Items decorator'
							p 'Line Items decorator'
							p 'Line Items decorator'
							spree_authorize! :update, spree_current_order, order_token
							spree_authorize! :show, @variant
	
							result = add_item_service.call(
								order: spree_current_order,
								variant: @variant,
								quantity: add_item_params[:quantity],
								public_metadata: add_item_params[:public_metadata],
								private_metadata: add_item_params[:private_metadata],
								options: add_item_params[:options],
								subscribe: 1
							)
	
							render_order(result)
            end
          end
				end
			end
		end
	end
end

::Spree::Api::V2::Storefront::CartController.prepend(Spree::Api::V2::Storefront::CartControllerDecorator)