class RegistrationsController < ::DeviseTokenAuth::RegistrationsController
  def render_create_success

    # if params[:role] === 'rg_user' do
    #   reg_key = RegistrationKey.find(combination: params[:combination])

    #   if reg_key !== nil do
    #     reg_key.university.rg_user.create(params)
    #   end
    # end
    
    if @resource.role === 'university'
      5.times { RegistrationKey.create(user: @resource) }
      @resource.reload

      render json: {
        status: 'success',
        data: {
          registration_keys: @resource.registration_keys,
          user: resource_data
        }
      }
    else
      render json: {
        status: 'success',
        data: {
          user: resource_data
        }
      }
    end
  end
end
