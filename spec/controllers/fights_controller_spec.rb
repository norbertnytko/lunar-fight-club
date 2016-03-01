require 'rails_helper'

RSpec.describe FightsController, type: :controller do
  let(:batman) { create :fighter }
  let(:magneto) { Fighter.create(
      first_name: 'Magneto',
      description:'Flight through magnetic fields.',
      skills: [
        Skill.create(name: 'Thoughts shield', level: 3),
        Skill.create(name: 'Charisma', level: 4)
      ]
    )}
  let(:fight) { Fight.create(fighters: [batman, magneto]) }

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
    let(:params) { { fight: fight.attributes } }
    subject { post :create, params }

    context 'with valid input' do
      it 'redirect to fighters page'

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
