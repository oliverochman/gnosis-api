RSpec.describe 'Registration', type: :request do
  let(:header) { { HTTP_ACCEPT: 'application/json' } }
  let(:registration_key) { 'o7A8pJcuvzhv7fih9Paak3nt' }

  describe 'of User with Research Group role with valid Registration Key' do
    before 'post new User info' do
      post '/api/v0/auth', params: { email: 'example@craftacademy.se',
                                    name: 'Research Group Alpha',
                                    role: 'research_group',
                                    password: 'password',
                                    password_confirmation: 'password',
                                    sign_up_registration_key: registration_key },
                                    headers: headers                             
    end

    it 'returns a 200 response if post request was successful' do
      expect(response.status).to eq 200
    end

    it 'verifies that User with Research Group role is created' do
      name = User.last.name
      expect(name).to eq 'Research Group Alpha'
    end

    it 'verifies that created user have a Registration key' do
      sign_up_registration_key = User.last.sign_up_registration_key
      expect(sign_up_registration_key).to eq registration_key
    end

  end

  describe 'of User with Research Group role without Registration Key' do
    before 'post new User info' do
      post '/api/v0/auth', params: { email: 'maria@craftacademy.se',
                                     name: 'Fat Jesus',
                                     role: 'research_group',
                                     password: 'password',
                                     password_confirmation: 'password',
                                     sign_up_registration_key: nil },
                                     headers: headers
    end

    it 'returns a 204 response, save successfully attempted but nothing saved' do
      expect(response.status).to eq 204
    end

  end

  describe 'of User with Research Group role without Registration Key' do
    before 'post new User info' do
      post '/api/v0/auth', params: { email: 'maria@craftacademy.se',
                                     name: 'Fat Jesus',
                                     role: 'research_group',
                                     password: 'password',
                                     password_confirmation: 'password',
                                     registration_key: 'o7A8pJcuvzhv7fih9Paerror' },
                                     headers: headers
    end

    it 'returns a 204 response, save successfully attempted but nothing saved' do
      expect(response.status).to eq 204
    end

  end

end