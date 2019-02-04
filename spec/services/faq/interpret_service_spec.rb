
require_relative './../../spec_helper.rb'

describe 'InterpretService' do
  describe '#call' do
    context 'Invalid command' do
      it "return don't find message" do
        response = InterpretService.call('', {})
        expect(response).to match("Não compreendi o seu desejo")
      end
    end

    context 'Valid command' do
      it "create faq" do
        expect(Faq.all.count).to eq(0)
        InterpretService.call('create', {"question" => 'question', "answer" => 'answer', "hashtags" => 'a,b'})
        expect(Faq.all.count).to eq(1)
      end
      it "list faqs" do
        expect(Faq.all.count).to eq(0)
        faq1 = create(:faq)
        faq2 = create(:faq)
        expect(Faq.all.count).to eq(2)
        c = InterpretService.call('list', {})
        expect(c).to match(faq1.question)
      end
    end
  end
end
