class RegistrationsController < ::DeviseTokenAuth::RegistrationsController

  def create
    
    binding.pry
    
    super
  end
  
  def render_create_success
    if @resource.role === 'university'  
      5.times { RegistrationKey.create(user: @resource) }
      @resource.reload
    end
    
    render json: {
      status: 'success',
      data: {
        registration_keys: @resource.registration_keys,
        user: resource_data
      }
    }
  end
end
