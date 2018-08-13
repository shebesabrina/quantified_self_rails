require 'rails_helper'

describe 'Meals API' do
  it 'returns all meals in database' do
    create_list(:meal, 3)

    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body, symbolize_names: true)
    expect(meals.count).to eq(3)
  end
end
