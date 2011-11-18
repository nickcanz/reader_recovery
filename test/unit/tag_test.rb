require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "save from upload" do
    tags = [
      "label/read",
      "label/later",
      "label/maybe",
      "label/tonight"
    ]

    note = Note.new(:id => 88)

    prev_count = Tag.all.count

    Tag.save_from_upload tags, note

    assert_equal prev_count+4, Tag.all.count
  end
end
