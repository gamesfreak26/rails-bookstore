class CartController < ApplicationController
  def show
    @order_items = current_order.order_items

    p "STRIPE SESSION"

    @stripe_session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: @order_items.collect { |item| item.to_builder.attributes! },
      success_url: "#{root_url}payments/success",
      cancel_url: "#{root_url}books"
    })

    @session_id = @stripe_session.id
  end
end
