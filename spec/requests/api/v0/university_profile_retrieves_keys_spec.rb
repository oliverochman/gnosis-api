RSpec.describe 'University Profile retrieves research keys', type: :request do
  let(:university) { create(:user, role: :university, subscriber: true) }
  let(:credentials) { university.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'research keys are returned for subscribed user' do
    before do
      5.times { RegistrationKey.create(user: university) }
      get '/api/v0/subscriptions', headers: headers, params: { uid: headers["uid"] }
    end

    it 'returns a 200 response' do
      expect(response.status).to eq 200
    end
    
    it 'returns 5 research keys' do
      binding.pry
      expect(response_json.count).to eq 5
    end
  end
end

function toArray(ourArray) {
  const result = [];
  for (const prop in ourArray) {
      const value = ourArray[prop];
      if (typeof value === 'object') {
          result.push(toArray(value)); // <- recursive call
      }
      else {
          result.push(value);
      }
  }
  return result;
}