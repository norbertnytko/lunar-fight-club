require 'rails_helper'

describe FighterDecorator do

  describe '#name' do
    let(:fighter) { build(:fighter).decorate }
    context 'second name is present' do
      it 'returns both names' do
        expect(fighter.name).to eq "#{fighter.first_name} #{fighter.last_name}"
      end
    end

    context 'second name is not present' do
      before { allow(fighter).to receive(:last_name).and_return(nil) }
      it 'returns first name' do
        expect(fighter.name).to eq "#{fighter.first_name}"
      end
    end
  end
end
