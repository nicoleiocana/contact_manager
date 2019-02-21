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
  
  it "responds with its phone numbers after they've been created" do
    phone_number = company.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end
  
  it "responds with its email addresses after they've been created" do
    email = company.email_addresses.build(address: "test@example.com")
    expect(email.address).to eq('test@example.com')
  end
  
end
