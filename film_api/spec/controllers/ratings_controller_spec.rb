require 'rails_helper'

describe RatingsController, type: :controller do
  describe "POST create" do
    subject { send(:post, :create, params) }
    let(:params) { { score: 10, film_id: 1 } }

    before do
      # would typically use factory_girl here
      Film.create(title: 'Shawshank Redemption', description: 'Best movie ever.', year: 1994)
      subject
      @response = JSON.parse(response.body)["rating"]
    end

    it "returns both films" do
      expect(@response["score"]).to eq(10)
      expect(@response["film_id"]).to eq(1)
    end
  end
end
