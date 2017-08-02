require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

include RandomData

  let(:my_advertisement) { Advertisement.create!(id: 1, title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }


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

  describe "GET show" do
       it "returns http success" do
   # #16
         get :show, {id: my_advertisement.id}
         expect(response).to have_http_status(:success)
       end
       it "renders the #show view" do
   # #17
         get :show, {id: my_advertisement.id}
         expect(response).to render_template :show
       end

       it "assigns my_advertisement to @advertisement" do
         get :show, {id: my_advertisement.id}
   # #18
         expect(assigns(:advertisement)).to eq(my_advertisement)
       end
     end

     describe "GET new" do
          it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
          end

     # #2
          it "renders the #new view" do
            get :new
            expect(response).to render_template :new
          end

     # #3
          it "instantiates @advertisement" do
            get :new
            expect(assigns(:advertisement)).not_to be_nil
          end
        end

        describe "POST create" do
     # #4
          it "increases the number of Advertisement by 1" do
            expect{
              post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 66}
              }.to change(Advertisement,:count).by(1)
          end

     # #5
          it "assigns the new advertisement to @advertisement" do
            post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 66}
            expect(assigns(:advertisement)).to eq Advertisement.last
          end

     # #6
          it "redirects to the new advertisement" do
            post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 66}
            expect(response).to redirect_to Advertisement.last
          end
        end

end
