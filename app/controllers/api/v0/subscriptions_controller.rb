class Api::V0::SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    subscribedUni = User.find_by(uid: params[:uid])
    reg_keys = RegistrationKey.where(user_id: subscribedUni.id)
    render json: reg_keys, each_serializer: RegistrationKeysSerializer
  end

  def create
    if params[:stripeToken]
      begin
        customer =
          Stripe::Customer.create(
            email: current_user.email, source: params[:stripeToken]
          )
  
        charge =
          Stripe::Charge.create(
            customer: customer.id,
            amount: 10_000,
            description: 'Gnosis Yearly Subscription',
            currency: 'sek'
          )
  
        if charge.paid?
          render_create_success

          current_user.update_attribute(:subscriber, true)
          current_user.reload
          render json: { message: 'Payment successful' }
        else    
          render_error(charge.errors)
        end

      rescue => error
        render_error(error.message)
      end
    else
      render_error('No stripe token detected')
    end
    
  end

  def new; end

  private

  def render_create_success
    if current_user.role == 'university'  
      5.times { RegistrationKey.create(user: current_user) }
      current_user.reload
    end
    
    render json: {
            status: 'success',
            data:
              resource_data.merge(
                registration_keys: current_user.registration_keys
              )
          }
  end

  def render_error(message)
    render json: { 
      errors: message
    }, status: 402
  end
end
