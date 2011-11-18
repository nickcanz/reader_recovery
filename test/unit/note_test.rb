require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "title is required" do
    note = Note.new(:content => 'http://www.google.com', :published_date => Time.now)
    assert note.invalid?
  end

  test "published date is required" do
    note = Note.new(:title => 'The title', :content => 'http://www.google.com')
    assert note.invalid?
  end

  test "content is required and formatted" do
    note = Note.new(:title => 'The title', :published_date => Time.now)
    assert note.invalid?
  end

  test "all data filled out is valid" do
    note = Note.new(
      :title => 'My title',
      :content => 'My content',
      :published_date => Time.now)

    assert note.valid?
  end

  test "save from upload" do

    items = [ {
        "published" => Date.new(2011, 10, 20).to_time.to_i,
        "title" => 'Link title',
        "content" => {
          "content" => '<h1>My content</h1>'
        },
        "categories" => [
          "tag1",
          "tag2",
          "tag3"
        ]
      }, {
        "published" => Date.new(2011, 10, 21).to_time.to_i,
        "title" => 'Another title',
        "content" => {
          "content" => '<h2>Much more content</h2>'
        },
        "categories" => [
          "tag4",
          "tag5"
        ]
      }
    ]

    current_count = Note.all.count

    upload = Upload.create(
      :upload_time => Time.now,
      :contents => 'Content'
    )

    Note.save_from_upload(items, upload)

    assert_equal current_count+2, Note.all.count

    latest_note = Note.find(:all, :order => 'created_at desc', :limit => 1).first
    assert_equal 2, latest_note.tags.count
    assert_not_nil latest_note.tags.detect { |t| t.name == "tag4" }
    assert_not_nil latest_note.tags.detect { |t| t.name == "tag5" }
  end
end
