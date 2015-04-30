require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "it always has a user" do
    refute Team.new(user_id: nil).save
  end
end
