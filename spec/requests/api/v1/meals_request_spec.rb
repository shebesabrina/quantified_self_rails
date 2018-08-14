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
    id = create(:meal).id

    get "/api/v1/meals/#{id}/foods"

    expect(status).to eq(404)

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(0)

    meal.foods.create!(name: 'Banana', calories: 150)
    meal.foods.create!(name: 'Lamp', calories: 0)
    create(:food)

    get "/api/v1/meals/#{id}/foods"

    expect(response).to be_success

    foods = JSON.parse(response.body)
    expect(foods.count).to eq(meal.foods.count)
  end
end
