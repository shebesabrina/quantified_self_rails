require 'rails_helper'

describe "Foods API" do
  it "returns all foods in database" do
    create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_successful

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(3)

    # expect(response.status).to eq(404)
  end

  it "can get one food item by its id" do
    id = create(:food).id

    get "/api/v1/foods/#{id}"

    food = JSON.parse(response.body)

    expect(response).to be_successful
    expect(food["id"]).to eq(id)
  end

  it "can create a new food item" do
    food_params = { name: "strawberry", calories: 100 }

    post "/api/v1/foods", params: {food: food_params}
    food = Food.last

    assert_response :success
    expect(response).to be_successful
    expect(food.name).to eq(food_params[:name])
  end
end
