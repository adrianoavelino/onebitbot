require_relative './../../spec_helper.rb'

describe 'FaqModule::CreateService' do
  before do
    # @company = create(:company)
  end

  describe '#call' do
    context 'Without hashtag params' do
      it 'will receive a error' do
        question = FFaker::Lorem.sentence
        answer = FFaker::Lorem.sentence
        createService = FaqModule::CreateService.new({"question" => question, "answer" => answer})
        response = createService.call()
        expect(response).to match("Hashtag obrigatória")
      end
    end

    context 'With Valid params' do
      it 'Receive success message' do
        question = FFaker::Lorem.sentence
        answer = FFaker::Lorem.sentence
        hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
        createService = FaqModule::CreateService.new({"answer" => answer, "hashtags" => hashtags})
        response = createService.call()
        expect(response).to match("Criado com sucesso")

      end
    end
  end

end
