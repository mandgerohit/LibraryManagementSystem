require 'test_helper'

class BookTest < ActiveSupport::TestCase

book=Book.create(title: "",isbn:4444444444444444444, author: "Polo Marco",description:"sdvivivf")
book.save
  test 'should be invalid if name is missing' do
    
    assert book.valid?,'Invalid Title'
    
  end

  test 'should be invalid if isbn exceeds max length' do
    
    assert book.valid?,'Invalid ISBN'
  end

  test 'should be invalid if title is not unique' do
    
    identical = book.dup
    assert identical.valid?
  end
end
