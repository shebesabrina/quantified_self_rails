require 'rails_helper'

describe "Foods API" do
  it "returns all foods in database" do
    create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_successful
  end
end
