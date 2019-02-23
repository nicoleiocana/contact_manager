require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  let(:person) { Person.create(first_name: "Jane", last_name: "Doe") }
  let(:phone_number) { PhoneNumber.create!(contact_id: person.id, contact_type: "Person", number: "123-456-7890") }
  before(:each) do
    @phone_number = assign(:phone_number, phone_number)
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do

      assert_select "input[name=?]", "phone_number[number]"

      assert_select "input[name=?]", "phone_number[contact_id]"
    end
  end
  
  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "Update Phone Number for #{phone_number.contact.first_name} #{phone_number.contact.last_name}")
  end
  
end
