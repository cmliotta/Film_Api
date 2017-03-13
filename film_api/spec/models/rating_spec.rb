require 'rails_helper'

describe Rating, type: :model do
  # would typically use factory_girl here
  before do
    Film.create(title: 'Shawshank Redemption', description: 'Best movie ever.', year: 1994)
  end
  subject { Rating.create(film_id: 1, score: 10) }

  describe "associations" do
    it { expect(subject).to belong_to :film }
  end

  describe "validations" do
    it { expect(subject).to be_valid }

    context "without film_id" do
      it "raise_error" do
        expect(Rating.create(film_id: nil, score: 10)).to_not be_valid
      end
    end

    context "without score" do
      it "raise_error" do
        expect(Rating.create(film_id: 1, score: nil)).to_not be_valid
      end
    end

    context "with score outside range" do
      it "raise_error" do
        expect(Rating.create(film_id: 1, score: 20)).to_not be_valid
      end
    end
  end
end
