RSpec.describe 'Api::ArticlesController', type: :request do
  describe "GET /api/articles" do
    let!(:articles) { 5.times {create(:article)}}
    before do 
      get '/api/articles'
    end
    it "returns a collection of 5 articles" do
      expect(JSON.parse(response.body).count).to eq 5
    end
  end

  describe "GET /api/articles/:id" do
    let(:user) {create(:user)}
    let(:credentials) { user.create_new_auth_token}
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
    let!(:article) { create(:article, title: 'Rails 5 is awesome!')}
    
    describe 'for an authenticated user' do 
      before do
        get "/api/articles/#{article.id}", headers: headers
      end
  
      it 'returns an instance of Article' do 
        expect(JSON.parse(response.body)['title']).to eq 'Rails 5 is awesome!'
      end
    end

    describe 'unauthenticated user' do 
      before do 
        get "/api/articles/#{article.id}", headers: nil
      end

      it 'returns an error message' do  
        expected_error_message = "You need to sign in or sign up before continuing."
        expect(JSON.parse(response.body)['errors']).to include expected_error_message
      end
    end
    
  end
end