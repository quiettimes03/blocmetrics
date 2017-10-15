require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:application) {Application.create!(name: "New Name", url: "Unique URL")}

  describe "attributes" do
    it "has name and url attributes" do
      expect(application).to have_attributes(name: "New Name", url: "Unique URL")
    end
  end
end
