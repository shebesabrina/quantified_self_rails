require 'rails_helper'

describe 'Meals API' do
  it 'returns all meals in database' do
    create_list(:meal, 3)

    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body, symbolize_names: true)
    expect(meals.count).to eq(3)
  end

  it "can get one meal by its id" do

    get "/api/v1/meals/8675309/foods"

    expect(status).to eq(404)

    breakfast = create(:meal, name: 'breakfast')
    expect(Food.count).to eq(0)

    4.times do
      breakfast.meal_foods.create(food_id: create(:food).id)
    end
    id = create(:meal).id

    get "/api/v1/meals/#{id}/foods"

    expect(response).to be_success

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(breakfast.meal_foods.count)
  end
end
