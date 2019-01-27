require_relative './../../spec_helper.rb'

describe 'FaqModule::CreateService' do
  before do
    # @company = create(:company)
    @question = FFaker::Lorem.sentence
    @answer = FFaker::Lorem.sentence
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  # after do
  #   require 'database_cleaner'
  #   DatabaseCleaner.strategy = :truncation
  #   DatabaseCleaner.clean
  # end

  describe '#call' do
    context 'Without hashtag params' do
      it 'will receive a error' do
        question = FFaker::Lorem.sentence
        answer = FFaker::Lorem.sentence
        createService = FaqModule::CreateService.new({"question" => @question, "answer" => @answer})
        response = createService.call()
        expect(response).to match("Hashtag obrigatória")
      end
    end

    context 'With Valid params' do
      before do
        @createService = FaqModule::CreateService.new({"question" => @question, "answer" => @answer, "hashtags" => @hashtags})
        @response = @createService.call()
      end

      it 'Receive success message' do
        expect(@response).to match("Criado com sucesso")
      end

      it 'Question and answer is present in database' do
        expect(Faq.last.question).to match(@question)
        expect(Faq.last.answer).to match(@answer)
      end

      it "Hashtags are created" do
        expect(@hashtags.split(/[\s,]+/).first).to match(Faq.last.hashtags.first.name)
        expect(@hashtags.split(/[\s,]+/).last).to match(Faq.last.hashtags.second.name)
        # expect(@hashtags.split(/[\s,]+/).last).to match(Hashtag.where("name = ?", @answer.last.name))
      end

    end
  end

end
