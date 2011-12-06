require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  setup do
    @base_note_attrs = {
      :content => 'http://www.google.com',
      :published_date => Time.now,
      :title => 'The Googles',
      :title_href => 'http://www.google.com',
    }
  end

  test "Note:title_href is required" do
    @note_attrs = @base_note_attrs.merge(:title_href => '')
    note = Note.new(@note_attrs)
    assert note.invalid?, "Title_href is required on Note"
  end

  test "Note:title is required" do
    @note_attrs = @base_note_attrs.merge(:title => '')
    note = Note.new(@note_attrs)
    assert note.invalid?, "Title is required on Note"
  end

  test "Note:published_date is required" do
    @note_attrs = @base_note_attrs.merge(:published_date => nil)
    note = Note.new(@note_attrs)
    assert note.invalid?, "Published date is required on note"
  end

  test "Note, all data filled out is valid" do
    note = Note.new(@base_note_attrs)
    assert note.valid?
  end
  test "Note with no tags_attributes has no Tags" do
    assert Note.new.tags.empty?
  end

  test "Note with tags_attributes has Notes" do
    @note_attrs = @base_note_attrs.merge(
      :tags_attributes => [{ :name => "rails" }, { :name => "ruby" }]
    )
    note = Note.create!(@note_attrs)
    assert_equal 2, note.tags.size
  end
end
