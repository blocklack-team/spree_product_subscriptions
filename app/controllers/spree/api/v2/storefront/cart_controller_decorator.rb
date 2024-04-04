module Spree
	module Api
		module V2
			module Storefront
				module CartControllerDecorator
          def self.prepended(base)
            def add_item
              super # Llama al método create del controlador original
              # Agrega aquí la lógica adicional si es necesario

              p 'Line Items decorator'
							p 'Line Items decorator'
							p 'Line Items decorator'
							p 'Line Items decorator'
							p 'Line Items decorator'
            end
          end
				end
			end
		end
	end
end

::Spree::Api::V2::Storefront::LineItemsController.prepend(Spree::Api::V2::Storefront::CartControllerDecorator)