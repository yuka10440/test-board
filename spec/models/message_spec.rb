require 'spec_helper'

describe Message do
  it 'does not allow empty title' do
    expect(FactoryGirl.build(:message, title: '')).to have(1).errors_on(:title)
  end
  it 'does not allow empty body' do
    expect(FactoryGirl.build(:message, body: '')).to have(1).errors_on(:body)
  end
  it 'is valid with title and body' do
    expect(FactoryGirl.build(:message)).to be_valid
  end
end