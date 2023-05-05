require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      book = FactoryBot.create(:book)
      get :show, params: { id: book.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      book = FactoryBot.create(:book)
      get :edit, params: { id: book.to_param }
      expect(response).to be_successful
    end
  end

end
