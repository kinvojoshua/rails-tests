require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) do
    User.create first_name: "joshua", last_name: "doewa", middle_name: "p", email: "johndoe@gmail.com"
  end

  let!(:post) do
    Post.create title: "wawa", body: "wuwu", status: "draft", user: user
  end
  context "scopes" do

    describe ".published" do
      it "returns published posts" do
        post.update status: "published"
        expect(Post.published).to include post
      end

      it "does not return posts that are not published" do
        expect(Post.published).not_to include post
      end
    end

    describe ".draft" do
      it "returns draft posts" do
        expect(Post.draft).to include post
      end

      it "returns posts that are not draft" do
        post.update status: "published"
        expect(Post.draft).not_to include post
      end
    end
  end

  context "callbacks" do
    describe ".add_title_to_body" do
      it "returns new body title + body" do
        title = "title"
        body = "body"
        p = Post.create title: title, body: body, status: "draft", user: user
        expected = "#{title} - #{body}"

        expect(p.body).to eq expected
      end
    end
  end

  context "validations" do

    let!(:error_list) { Post.create.errors.full_messages }

    describe "presence" do
      it "must return User must Exist" do
        error = Post.create title: "t", body: "b", status: "draft"
        expect(error_list).to include error.errors.full_messages[0]
      end

      it "must return Title can't be blank" do
        error = Post.create body: "b", status: "draft", user_id: 1
        expect(error_list).to include error.errors.full_messages[0]
      end

      it "must return Body can't be blank" do
        error = Post.create title: "b", status: "draft", user_id: 1
        expect(error_list).to include error.errors.full_messages[0]
      end

      it "must return Status can't be blank" do
        error = Post.create title: "t", body: "b", user_id: 1
        expect(error_list).to include error.errors.full_messages[0]
      end

      it "must return Status is not included in the list" do
        error = Post.create title: "t", body: "b", status: "walawala", user_id: 1
        expect(error_list).to include error.errors.full_messages[0]
      end
    end

    describe "uniqueness" do

    end

    describe "inclusions" do

    end
  end
end
