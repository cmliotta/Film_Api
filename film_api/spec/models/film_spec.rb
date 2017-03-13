require 'rails_helper'

describe Film, type: :model do
  # would typically use factory_girl here
  subject { Film.create(title: 'Shawshank Redemption', description: 'Best movie ever.', year: 1994) }

  describe "associations" do
    it { expect(subject).to have_many :ratings }
  end

  describe "scopes" do
    context "by_title" do
      context "film exists" do
        it "returns film" do
          subject
          expect(Film.by_title('S').count).to eq(1)
        end
      end

      context "film does not exist" do
        it "does not returns film" do
          subject
          expect(Film.by_title('z').count).to eq(0)
        end
      end
    end
  end

  describe "average_rating" do
    before do
      Rating.create(film_id: 1, score: 10)
      Rating.create(film_id: 1, score: 5)
    end

    it "returns average_rating" do
      subject
      expect(subject.average_rating).to eq(7.5)
    end
  end
end
