require 'rails_helper'

describe Comment, type: :model do

  describe '#made_within_one_hour?' do

    before(:each) do
      @comment = Comment.new
      @current_time = Time.new(2014, 1, 1, 12,  0, 0)
    end

    it 'should return true when comment is added within an hour' do
      comment_time = Time.new(2014, 1, 1, 11, 30, 0)
      allow(@comment).to receive(:created_at).and_return comment_time

      expect(@comment.made_within_one_hour?(@current_time)).to eq(true)
    end

    it 'should return false when comment is added over an hour ago' do
      comment_time = Time.new(2014, 1, 1, 10, 0, 0)
      allow(@comment).to receive(:created_at).and_return comment_time

      expect(@comment.made_within_one_hour?(@current_time)).to eq(false)      
    end
  end

  describe "#made_within_one_hour? (integration)" do

    it 'should return true when comment is added within an hour' do
      comment = Comment.create(content: "test")
      current_time = comment.created_at + 30.minutes

      expect(comment.made_within_one_hour?(current_time)).to eq(true)
    end

    it 'should return false when comment is added over an hour ago' do
      comment = Comment.create(content: "test")
      current_time = comment.created_at + 2.hours

      expect(comment.made_within_one_hour?(current_time)).to eq(false)
    end

  end

end	