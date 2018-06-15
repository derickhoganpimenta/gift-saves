require 'rails_helper'

describe HomesController, type: :controller do
  describe "#open index" do
    it "Should be open homes#index" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
