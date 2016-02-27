require 'rails_helper'

RSpec.describe FightersController, type: :controller do
  subject(:fighter) { create :fighter }

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'expose fighters' do
      get :index
      expect(controller.fighters).to eq([fighter])
    end
  end

  describe 'GET #show 'do
    it 'renders the #show view' do
      get :show, id: fighter
      expect(response).to render_template :show
    end

    it 'expose requested fighter' do
      get :show, id: fighter
      expect(controller.fighter).to eq(fighter)
    end
  end

  describe 'GET #new 'do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let!(:params) { { fighter: build(:fighter).attributes } }
    subject { post :create, params }

    context 'with valid input' do
      it { is_expected.to redirect_to fighter_path(controller.fighter) }

      it 'flashes info'

      it 'creates student' do
        expect{ subject }.to change(Fighter, :count).by(1)
      end
    end

    context 'with invalid input' do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :new
    end
  end
end
