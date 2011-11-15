require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "title is required" do
    note = Note.new(:href => 'http://www.google.com', :published_date => Time.now)
    assert note.invalid?
  end

  test "published date is required" do
    note = Note.new(:title => 'The title', :href => 'http://www.google.com')
    assert note.invalid?
  end

  test "href is required and formatted" do
    note = Note.new(:title => 'The title', :published_date => Time.now)
    assert note.invalid?

    note.href = 'not_a_url'
    assert note.invalid?

    note.href = 'http://is.a.valid.url.com'
    assert note.valid?
  end

  test "all data filled out is valid" do
    note = Note.new(
      :title => 'My title',
      :href => 'http://www.example.com',
      :published_date => Time.now)

    assert note.valid?
  end
end
