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

  test "Note:content is required and formatted" do
    @note_attrs = @base_note_attrs.merge(:content => '')
    note = Note.new(@note_attrs)
    assert note.invalid?, 'Content is required on note'
  end

  test "Note, all data filled out is valid" do
    note = Note.new(@base_note_attrs)
    assert note.valid?
  end

  test "Note#save_from_upload works" do

    items = [ {
        "published" => Date.new(2011, 10, 20).to_time.to_i,
        "title" => 'Link title',
        "alternate" => [{
          "href" => 'http://www.google.com',
        }],
        "content" => {
          "content" => '<h1>My content</h1>'
        },
        "categories" => [
          "/label/tag1",
          "/label/tag2",
          "/label/tag3"
        ]
      }, {
        "published" => Date.new(2011, 10, 21).to_time.to_i,
        "title" => 'Another title',
        "alternate" => [{
          "href" => 'http://www.moregoogle.com',
        }],
        "content" => {
          "content" => '<h2>Much more content</h2>'
        },
        "categories" => [
          "/label/tag4",
          "/label/tag5"
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

  test "Note#save_from_upload handles null content" do
    upload_record = Upload.create( :upload_time => Time.now, :contents => 'd')
    items = [{
      "title" => "The title",
      "alternate" => [{
        "href" => "my href",
      }],
      "published_date" => Time.now,
      "categories" => [
        "tag1",
        "tag2"
      ]
    }]

    Note.save_from_upload(items, upload_record)
  end
end
