# app/models/spree/order_decorator.rb

module Spree
  module OrderDecorator
    def self.prepended(base)
      base.has_one :order_subscription, class_name: "Spree::OrderSubscription", dependent: :destroy
      base.has_one :parent_subscription, through: :order_subscription, source: :subscription
      base.has_many :subscriptions, class_name: "Spree::Subscription", foreign_key: :parent_order_id, dependent: :restrict_with_error

      base.state_machine.after_transition to: :complete, do: :enable_subscriptions, if: :any_disabled_subscription?

      base.after_update :update_subscriptions
    end

    def available_payment_methods
      if subscriptions.exists?
        @available_payment_methods = Spree::Gateway.active.available_on_front_end
      else
        @available_payment_methods ||= Spree::PaymentMethod.active.available_on_front_end
      end
    end

    private

    def enable_subscriptions
      p '#estoy actualizando o creando la subscription'
      p '#estoy actualizando o creando la subscription'
      p '#estoy actualizando o creando la subscription'
      subscriptions.each do |subscription|
        subscription.update(
          source: payments.from_credit_card.first.source,
          enabled: true,
          ship_address: user.present? ? user.ship_address.try(:clone) : ship_address.clone,
          bill_address: user.present? ? user.bill_address.try(:clone) : bill_address.clone
        )
      end
      p '#Finish actualizando o creando la subscription'
      p '#Finish actualizando o creando la subscription'
      p '#Finish actualizando o creando la subscription'
    end

    def any_disabled_subscription?
      subscriptions.disabled.any?
    end

    def update_subscriptions
      line_items.each do |line_item|
        if line_item.subscription_attributes_present?
          subscription = subscriptions.find_by(variant: line_item.variant)
          if subscription
            subscription.update(line_item.updatable_subscription_attributes)
          else
            Rails.logger.warn("Subscription not found for variant #{line_item.variant.id}")
          end
        end
      end
    end    
  end
end

::Spree::Order.prepend(Spree::OrderDecorator)
