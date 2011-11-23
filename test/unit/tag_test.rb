require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "Tag#save_from_upload only saves match" do

    tags = %w{
    user/17018757741875753863/label/rails
    user/17018757741875753863/label/ruby
    user/17018757741875753863/source/com.google/post
    user/17018757741875753863/state/com.google/read
    user/17018757741875753863/state/com.google/tracking-body-link-used
    user/17018757741875753863/state/com.google/tracking-item-link-used
    user/17018757741875753863/state/com.google/fresh
    }

    prev_count = Tag.all.count
    earliest_date = Time.now

    n = Note.new(:id => 5)
    Tag.save_from_upload(tags, n)

    assert_equal prev_count+2, Tag.all.count, "Shouldn't create tags that don't match the correct format"
  end

  test "Tag#save_from_upload handles null input" do
    Tag.save_from_upload nil, Note.new(:id => 1)
  end
end
