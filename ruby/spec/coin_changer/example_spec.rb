require 'spec_helper'

describe 'Rantly' do

  it 'should fail' do
    str = Rantly { string(:alnum) }
    email = "#{str}.#{str}@company.com"
    expect(email).to be('foo@company.com')
  end
end