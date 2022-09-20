require 'rails_helper'

RSpec.describe Post, type: :model do
  user_id = User.first.id
  post = Post.new(title: "title", body: "body", user_id: user_id) 


  it "should save if all fields are set" do
    expect(post).to be_valid
  end

  it "should not save if the title is blank" do
    post.title = ''
    expect(post).to_not be_valid
  end

  it "should not save if the body is blank" do
    post.body = ''
    expect(post).to_not be_valid
  end

  it "should not save if the user_id is blank" do
    post.user_id = ''
    expect(post).to_not be_valid  
  end

  it "should not save if the user_id is not exist" do
    post.user_id = 999
    expect(post).to_not be_valid
  end
end
