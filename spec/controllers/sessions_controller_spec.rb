require 'rails_helper'

describe SessionsController, type: :controller do
  describe "#open new" do
    it "Should be open sessions#new" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
