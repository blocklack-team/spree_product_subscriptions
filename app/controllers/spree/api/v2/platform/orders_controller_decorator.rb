# app/controllers/spree/orders_controller_decorator.rb
module Spree
  module Api
    module V2
      module Platform
        module OrdersControllerDecorator
          def self.prepended(base)
            base.before_action :add_subscription_fields, only: :populate, if: -> { params[:subscribe].present? }
            #base.before_action :restrict_guest_subscription, only: :update, unless: :spree_current_user
          end

          private

          def restrict_guest_subscription
            redirect_to spree.login_path, flash: { error: Spree.t(:required_authentication) } unless spree_current_user
          end

          def add_subscription_fields
            is_subscribed = params.fetch(:subscribe, "").present?
            existing_options = { options: params.fetch(:options, {}).permit! }
            updated_subscription_params = params.fetch(:subscription, {}).merge(subscribe: is_subscribed).permit!
            existing_options[:options].merge!(updated_subscription_params)
            params.merge!(existing_options)
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Platform::OrdersController.prepend(Spree::Api::V2::Platform::OrdersControllerDecorator)
