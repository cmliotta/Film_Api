require 'rails_helper'

describe FilmsController, type: :controller do
  describe "GET index" do
    subject { send(:get, :index, params) }
    let(:params) { {} }

    before do
      # would typically use factory_girl here
      Film.create(title: 'Shawshank Redemption', description: 'Best movie ever.', year: 1994)
      Film.create(title: 'Up', description: 'Second best movie ever.', year: 2009)
      subject
      @response = JSON.parse(response.body)["films"]
    end

    it "returns both films" do
      expect(@response.length).to eq(2)
      expect(@response[0]["title"]).to eq("Shawshank Redemption")
      expect(@response[1]["title"]).to eq("Up")
    end

    context "by_title scope" do
      let(:params) { { title: 'S' } }
      it "returns correct film" do
        expect(@response.length).to eq(1)
        expect(@response[0]["title"]).to eq("Shawshank Redemption")
      end
    end

    context "with limit and offset" do
      let(:params) { { limit: 1, offset: 1 } }
      it "returns correct film" do
        expect(@response.length).to eq(1)
        expect(@response[0]["title"]).to eq("Up")
      end
    end
  end

  describe "GET show" do
    subject { send(:get, :show, params) }
    let(:params) { { id: 'up' } }

    before do
      # would typically use factory_girl here
      Film.create(title: 'Shawshank Redemption', description: 'Best movie ever.', year: 1994)
      Film.create(title: 'Up', description: 'Second best movie ever.', year: 2009)
      subject
      @response = JSON.parse(response.body)["film"]
    end

    it "returns correct film" do
      expect(@response["title"]).to eq("Up")
      expect(@response["id"]).to eq(2)
    end
  end
end
