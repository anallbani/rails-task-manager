require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "valid with all attributes" do
    task = Task.new(title: "Title", details: "Some details", completed: false)
    assert task.valid?
  end

  test "invalid without title" do
    task = Task.new(details: "Some details", completed: false)
    assert_not task.valid?
    assert_includes task.errors[:title], "can't be blank"
  end

  test "invalid without details" do
    task = Task.new(title: "Title", completed: false)
    assert_not task.valid?
    assert_includes task.errors[:details], "can't be blank"
  end
end
