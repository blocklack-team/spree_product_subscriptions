# app/controllers/spree/users_controller_decorator.rb

module Spree
  module UsersControllerDecorator
    def self.prepended(base)
      base.before_action :load_subscriptions, only: :show
    end

    private

    def load_subscriptions
      @orders = spree_current_user.orders.complete.order(completed_at: :desc)
      @subscriptions = Spree::Subscription.active.order(created_at: :desc).with_parent_orders(@orders)
    end
  end
end

::Spree::UsersController.prepend(Spree::UsersControllerDecorator)

