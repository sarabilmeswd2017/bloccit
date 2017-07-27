require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

include RandomData

  let(:my_advertisement) { Post.create!(id: 1, title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
       get :index
 # #9
       expect(assigns(:advertisements)).to eq([my_advertisement])
     end
  end

  

end
