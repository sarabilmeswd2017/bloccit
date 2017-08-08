class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  after_save :update_post
  after_create :create_vote

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }, presence: true

private

   def update_post
     post.update_rank
   end

   def create_post
     user.votes.create.to eq(value: 1)
   end
end
