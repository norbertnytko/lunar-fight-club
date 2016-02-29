require 'rails_helper'

RSpec.describe FightsController, type: :controller do
  let!(:fight) { Fight.create }

  describe 'GET #index' do
    subject { get :index }

    it 'expose fighs' do
      expect(controller.fights).to eq [fight]
    end

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #show 'do
    subject { get :show, id: fight }

    it 'expose requested fight' do
      subject
      expect(controller.fight).to eq(fight)
    end

    it_behaves_like 'template rendering action', :show
  end

  describe 'GET #new 'do
    subject { get :new }
    it_behaves_like 'template rendering action', :new
  end

  describe 'POST #create' do
    let!(:params) { { fight: build(:fight).attributes } }
    subject { post :create, params }

    context 'with valid input' do
      it { is_expected.to redirect_to fight_path(controller.fight) }

      it 'flashes info'

      it 'creates student' do
        expect{ subject }.to change(Fight, :count).by(1)
      end
    end

    context 'with invalid input' do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :new
    end
  end

end
