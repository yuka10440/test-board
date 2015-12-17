require 'spec_helper'

describe MessagesController do
  describe 'GET #index' do
    it 'can get all message' do
      message = FactoryGirl.create(:message)
      get :index
      expect(assigns(:messages)).to match_array([message])
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end
describe 'GET #new' do
  it 'can get Message instance' do
    get :new
    expect(assigns(:message)).to be_a_new(Message)
  end
  it 'renders the new template' do
    get :new
    expect(response).to render_template :new
  end
end
describe 'POST #create' do
  context 'with valid attributes' do
    it 'save the new message in the databese' do
      expect{
        post :create, message: FactoryGirl.attributes_for(:message)
      }.to change(Message, :count).by(1)
    end
    it 'redirects to messages#show' do
      post :create, message: FactoryGirl.attributes_for(:message)
      expect(response).to redirect_to message_path(assigns[:message])
    end
  end
  context 'with invalid attributes' do
    it 'does not save the new message in the database' do
      expect{
        post :create, message: FactoryGirl.attributes_for(:message, title: '')
      }.to_not change(Message, :count)
    end
    it 're-renders the :new template' do
      post :create, message: FactoryGirl.attributes_for(:message, title:'')
      expect(response).to render_template :new
    end
  end
end
end
