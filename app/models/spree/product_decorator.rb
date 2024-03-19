module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_many :subscriptions, through: :variants_including_master, source: :subscriptions, dependent: :restrict_with_error
      base.has_many :product_subscription_frequencies, class_name: "Spree::ProductSubscriptionFrequency", dependent: :destroy
      base.has_many :subscription_frequencies, through: :product_subscription_frequencies, dependent: :destroy

      alias_attribute :subscribable, :is_subscribable

      self.whitelisted_ransackable_attributes += %w( is_subscribable )
    
      scope :subscribable, -> { where(subscribable: true) }
    
      validates :subscription_frequencies, presence: true, if: :subscribable?
    end

    ::Spree::Product.prepend self if ::Spree::Product.included_modules.exclude?(self)
  end
end
