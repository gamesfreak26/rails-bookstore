class PaymentsController < ApplicationController
  def webhook
    payment_intent_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
  end

  def success; end
end
