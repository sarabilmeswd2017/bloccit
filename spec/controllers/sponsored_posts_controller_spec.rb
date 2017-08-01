require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 34) }


  describe "GET show" do
    it "returns http success" do
      # #16
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      # #17
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsored_post to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      # #18
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    # #2
    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    # #3
    it "instantiates @sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "POST create" do
    # #4
    it "increases the number of SponsoredPost by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 34}}.to change(SponsoredPost,:count).by(1)
    end

    # #5
    it "assigns the new sponsored_post to @sponsored_post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 34}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

    # #6
    it "redirects to the new sponsored_post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 34}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      # #1
      expect(response).to render_template :edit
    end

    # #2
    it "assigns post to be updated to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id

      sponsored_post_instance = assigns(:sponsored_post)

      expect(sponsored_post_instance.id).to eq my_sponsored_post.id
      expect(sponsored_post_instance.title).to eq my_sponsored_post.title
      expect(sponsored_post_instance.body).to eq my_sponsored_post.body
    end
  end
  describe "PUT update" do
     it "updates sponsor_post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = 34

       put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price}

 # #3
       updated_sponsored_post = assigns(:sponsored_post)
       expect(updated_sponsored_post.id).to eq my_sponsored_post.id
       expect(updated_sponsored_post.title).to eq new_title
       expect(updated_sponsored_post.body).to eq new_body
       expect(updated_sponsored_post.price).to eq new_price
     end

     it "redirects to the updated sponsored_post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = 34

 # #4
       put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price}
       expect(response).to redirect_to [my_topic, my_sponsored_post]
     end
   end

   describe "DELETE destroy" do
     it "deletes the sponsored_post" do
       delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
 # #6
       count = SponsoredPost.where({id: my_sponsored_post.id}).size
       expect(count).to eq 0
     end

     it "redirects to topic show" do
       delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
 # #7
       expect(response).to redirect_to my_topic
     end
   end

end
