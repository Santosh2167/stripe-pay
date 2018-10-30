class PagesController < ApplicationController
    def home
    end
    def process_payment
                    @amount = 500

            customer = Stripe::Customer.create(
                :email => params[:stripeEmail],
                :source  => params[:stripeToken]
            )

            charge = Stripe::Charge.create(
                :customer    => customer.id,
                :amount      => @amount,
                :description => 'Rails Stripe customer',
                :currency    => 'aud'
            )

            redirect_to '/'

            rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
                end
end
