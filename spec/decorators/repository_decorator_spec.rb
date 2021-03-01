# frozen_string_literal: true

RSpec.describe RepositoryDecorator do
  describe '#languages' do
    context 'when repository has more than three languages' do
      let(:repository) { create(:repository, language: 'Javascript, Docker, Ruby, HTML, CSS').decorate }

      it 'returns only the first three' do
        expect(repository.languages).to eq('Javascript,  Docker e  Ruby')
      end
    end

    context 'when repository has less than three languages' do
      let(:repository) { create(:repository, language: 'Javascript, Docker').decorate }

      it 'returns available languages' do
        expect(repository.languages).to eq('Javascript e  Docker')
      end
    end

    context 'when repository has no languages' do
      let(:repository) { create(:repository, language: nil).decorate }

      it 'returns empty string' do
        expect(repository.languages).to eq ''
      end
    end
  end
end

