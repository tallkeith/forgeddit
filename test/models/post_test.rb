require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "posts must have a title" do
  	@post = Post.new(title: "")
  	refute @post.valid?
  end
end
