require_relative './../../spec_helper.rb'

describe FaqModule::RemoveService do
  describe '#call' do

    before do
      @faq = create(:faq)
      @removeService = FaqModule::RemoveService.new({"id" => @faq.id})
    end

    context 'Valid ID' do
      it 'Return success message' do
        response = @removeService.call()
        expect(response).to match("Deletado com sucesso")
      end

      it 'Remove Faq from database' do
        expect(Faq.all.count).to eq(1)
        response = @removeService.call()
        expect(Faq.all.count).to eq(0)
      end

      it 'Remove only unusable hashtags from faq' do
        hashtag1 = 'tag1'
        hashtag2 = 'tag2'
        @faq.hashtags << Hashtag.find_or_create_by(name: hashtag1)
        @faq.hashtags << Hashtag.find_or_create_by(name: hashtag2)

        faq2 = create(:faq)
        faq2.hashtags << Hashtag.find_or_create_by(name: hashtag1)

        expect(Faq.all.count).to eq(2)
        expect(Hashtag.all.count).to eq(2)
        response = @removeService.call()
        expect(Faq.all.count).to eq(1)
        expect(Hashtag.all.count).to eq(1)
      end
    end

    context 'Invalid ID' do
      it 'return error message' do
        @removeService = FaqModule::RemoveService.new({"id" => rand(1..9999)})
        response = @removeService.call()

        expect(response).to match("Questão inválida, verifique o Id")
      end
    end

  end

end
