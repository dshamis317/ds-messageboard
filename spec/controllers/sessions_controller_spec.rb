require 'spec_helper'

describe SessionsController do

  before :each do
    @user = User.create({name: 'Dmitry', password: 'password'})
  end

  describe 'User can login' do

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

  end # GET new

  describe 'POST create session' do

    before :each do
      post :create, {name: 'Dmitry', password: 'password'}
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'creates a session' do
      actual = User.last.id
      expected = @user.id
      expect(actual).to eq(expected)
    end

    it 'redirects to show' do
      response.should redirect_to root_path
    end

  end # POST create
end
