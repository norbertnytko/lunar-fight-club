require 'rails_helper'

RSpec.describe FightersController, type: :controller do
  let!(:fighter) { create :fighter }

  describe 'GET index' do
    subject { get :index }

    it 'expose fighters' do
      expect(controller.fighters).to eq([fighter])
    end

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #show 'do
    subject { get :show, id: fighter }

    it 'expose requested fighter' do
      subject
      expect(controller.fighter).to eq(fighter)
    end

    it_behaves_like 'template rendering action', :show
  end

  describe 'GET #new 'do
    subject { get :new }
    it_behaves_like 'template rendering action', :new
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
