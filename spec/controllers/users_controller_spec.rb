require 'spec_helper'

describe UsersController do
  describe 'GET new' do

    before :each do
      get :new
    end

    it 'responds successfully' do
      actual = response.code
      expected = '200'
      expect(actual).to eq(expected)
    end

    it 'renders the new template' do
      expect(response).to render_template('new')
    end

  end

  describe 'POST create' do

    before :each do
      post :create, {:user => {name: 'Dmitry', password: 'password'}}
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'inserts a user record' do
      actual = User.last.name
      expected = 'Dmitry'
      expect(actual).to eq(expected)
    end

    it 'redirects to root' do
      response.should redirect_to root_path
    end

  end
end
