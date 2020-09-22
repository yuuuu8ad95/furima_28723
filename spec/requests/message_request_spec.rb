require 'rails_helper'

RSpec.describe "Messages", type: :request do

  describe "GET /text:text" do
    it "returns http success" do
      get "/message/text:text"
      expect(response).to have_http_status(:success)
    end
  end

end
