require 'spec_helper'

describe PostsController do
  describe 'given a post' do

    before :each do
      @user = User.create({name: 'Dmitry'})
      @post = Post.new
      @post.message = 'Putting together this example is a lot of fun!'
      @post.user_id = @user.id
      @post.save
    end

    describe 'GET index' do

      before :each do
        get :index
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @posts' do
        actual = assigns(:posts)
        expected = [@post]
        expect(actual).to eq(expected)
      end

    end # GET index

    describe 'GET show' do

      before :each do
        get :show, :id => @post.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @post' do
        actual = assigns(:post)
        expected = @post
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

    end # GET show

    describe 'GET edit' do

      before :each do
        get :edit, :id => @post.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @post' do
        actual = assigns(:post)
        expected = @post
        expect(actual).to eq(expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

    end # GET edit

    describe 'POST update' do

      before :each do
        post :update, {:id => @post.id, :post => {message: 'TDD is the way of the future.'}}
      end

      it 'responds with a redirect' do
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'updates post record' do
        @post.reload
        actual = @post.message
        expected = 'TDD is the way of the future.'
        expect(actual).to eq(expected)
      end

      it 'redirects to show' do
        response.should redirect_to post_path(@post)
      end

    end # POST update

    describe 'DELETE destroy' do

      it 'destroys post record' do
        expect {delete :destroy, {:id => @post.id}}
        .to change(post, :count)
        .by(-1)
      end

    end # DELETE destroy

  end # Given a post

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

  end # GET new

  describe 'POST create' do

    before :each do
      post :create, {:post => {message: 'How is the weather in the Bay Area today?'}}
    end

    it 'responds with a redirect' do
      actual = response.code
      expected = '302'
      expect(actual).to eq(expected)
    end

    it 'inserts a post record' do
      actual = post.last.message
      expected = 'How is the weather in the Bay Area today?'
      expect(actual).to eq(expected)
    end

    it 'redirects to show' do
      response.should redirect_to post_path(post.last)
    end

  end # POST create
end
