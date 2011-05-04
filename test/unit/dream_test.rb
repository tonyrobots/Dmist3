require 'test_helper'

class DreamTest < ActiveSupport::TestCase
  test "can create dream" do
    dream = Dream.new
    dream.user = users(:user_00001)
    dream.title = "Test Title"
    dream.body = "fdsfjkasdhfjkds fjdhf adjsfhlkasdfjds fds  fds jfasldkfhjdsfh dsafhljds fjhads lfhdsj klfhjaskdl f"
    
    assert dream.save
  end
  
  test "cant create dream without title or body" do
    dream = Dream.new
    assert !dream.valid?
    assert dream.errors[:title].any?
    assert dream.errors[:body].any?
    assert_equal ["can't be blank"], dream.errors[:title]
    assert_equal ["can't be blank"], dream.errors[:body]
    assert !dream.save
  end
  
  test "can update dream" do
    dream = dreams(:dream_00001)
    assert dream.update_attributes(:title => 'New Title')
  end
  
  test "can delete dream" do
    dream = dreams(:dream_00001)
    dream.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Dream.find(dream.id)}
  end
  
  
end
