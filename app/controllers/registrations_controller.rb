class RegistrationsController < ::DeviseTokenAuth::RegistrationsController

  def create
    if params[:role] === 'research_group'
      reg_key = RegistrationKey.find_by(combination: params[:sign_up_registration_key])
      unless reg_key.nil?
        
        binding.pry
        
      else
        render json: {
          status: 'error',
          data:   resource_data,
          errors: 'Invalid registartion key'
        }, status: 422
      end
    end
    
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
