require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) do
    Company.new(name: "Startup")
  end
  
  it 'is valid' do
    expect(company).to be_valid
  end
  
  it 'is invalid' do
    company.name = nil
    expect(company).not_to be_valid
  end
  
end
