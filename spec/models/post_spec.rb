# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "#to_s" do
    let(:post) {create(:post)}
    it { expect(post.to_s).to eq post.title }
  end

end
