require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  test "Upload:upload_time is required" do
    upload = Upload.new
    upload.name = "my upload"
    assert upload.invalid?
  end

  test "Upload:name is required" do
    upload = Upload.new
    upload.upload_time = Time.now
    assert upload.invalid?
  end

  test "Upload having required fields marks as valid" do
    upload = Upload.new
    upload.upload_time = Time.now
    upload.name = "my content"
    assert upload.valid?
  end

  test "Upload created with empty items has no Notes" do
    upload = Upload.create! do |u|
      u.items = []
      u.name = "my upload"
      u.upload_time = Time.now
    end
    assert_equal 0, upload.notes.size
    assert_equal 0, upload.notes.count
  end

  test "Upload with items has Notes" do
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
    upload = Upload.create! do |u|
      u.items = items
      u.name = "my upload"
      u.upload_time = Time.now
    end
    assert_equal 2, upload.notes.size
    assert_equal 2, upload.notes.count
  end

  test "Upload with items and categories has Notes with Tags" do
    tag_name1, tag_name2 = 'ruby', 'rails'
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
          "user/123/label/#{tag_name1}",
          "user/123/label/#{tag_name2}",
          "not/a/tag"
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
    upload = Upload.create! do |u|
      u.items = items
      u.name = "my upload"
      u.upload_time = Time.now
    end
    note = upload.notes.first
    assert_equal 2, note.tags.size
    assert_equal 2, note.tags.count
    assert note.tags.detect{|tag| tag.name == tag_name1 }
    assert note.tags.detect{|tag| tag.name == tag_name2 }
  end
end
