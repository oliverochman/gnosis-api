include Warden::Test::Helpers

RSpec.describe Api::V0::ArticlesController, type: :request do
  let(:rg_user) { FactoryBot.create(:user, role: :research_group) }
  let(:credentials) { rg_user.create_new_auth_token }
  let(:headers) { {HTTP_ACCEPT: "application/json"}.merge!(credentials) }

  describe 'research group POST article' do 
    before do
      post '/api/v0/articles' , params: {
        article: {
          title: 'Test article',
          body: 'Lorum lorum lorum',
          author: rg_user.name
        }
      }, headers: headers
    end

    it 'research group user creates new article' do  
      binding.pry
      
      expect(response.status).to eq 200
    end
  end
end