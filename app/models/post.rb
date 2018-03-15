# app/models/post.rb

class Post < ApplicationRecord

  # friendly url
  extend FriendlyId
  friendly_id :title, use: :slugged

  # validations
  validates_presence_of :title

  # callbacks
  before_save :anti_spam

  def to_s
    return "#{self.title}"
  end

  def anti_spam
    doc = Nokogiri::HTML::DocumentFragment.parse(self.content)
    doc.css('a').each do |a|
      a[:rel] = 'nofollow'
      a[:target] = '_blank'
    end
    self.content = doc.to_s
  end

end
