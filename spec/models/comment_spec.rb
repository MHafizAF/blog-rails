require 'rails_helper'

RSpec.describe Comment, type: :model do
  user_id = User.first.id
  post_id = Post.first.id
  comment = Comment.new(post_id: post_id, user_id: user_id, comment: "comment") 


  it "should save if all fields are set" do
    expect(comment).to be_valid
  end

  it "should not save if the post_id is blank" do
    comment.post_id = ''
    expect(comment).to_not be_valid
  end

  it "should not save if the user_id is blank" do
    comment.user_id = ''
    expect(comment).to_not be_valid
  end

  it "should not save if the comment is blank" do
    comment.comment = ''
    expect(comment).to_not be_valid  
  end

  it "should not save if the post_id is not exist" do
    comment.post_id = 999
    expect(comment).to_not be_valid
  end

  it "should not save if the user_id is not exist" do
    comment.user_id = 999
    expect(comment).to_not be_valid
  end
end
