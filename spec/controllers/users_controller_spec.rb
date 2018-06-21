require 'rails_helper'

describe UsersController, type: :controller do
  describe "#open new" do
    it "Should be open users#new" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
