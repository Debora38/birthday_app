require 'capybara/rspec'
require "app"
require 'birthday_calculator'

feature 'Calculates days left' do
  scenario 'should enter a name' do
    visit('/')
    fill_in :name, with: 'Debora'
    select '29', from: 'day'
    select 'April', from: 'month'
    click_button "Let's Go!"
    expect(page).to have_content "Your Birthday is 90 days away, Debora!"
  end
end


RSpec.describe Birthday_calculator do

  context "#today" do
    it 'should return todays date in Julian' do
      date = Birthday_calculator.new(29, "April")
      expect(date.today).to eq 2458508
    end
  end
  context "#birthday" do
    it 'should return todays date in Julian' do
      date = Birthday_calculator.new(29, "April")
      expect(date.birthday).to eq 2458603
    end
  end

  context "#birthday_month" do
    it 'should return the month in integer' do
      date = Birthday_calculator.new(29, "April")
      expect(date.birthday_month).to eq '04'
    end
  end

  context "#days_away" do
    it 'should return days away for birthday' do
      date = Birthday_calculator.new(29, "April")
      allow(date).to receive(:today).and_return 2458508
      expect(date.days_away).to eq 95
    end
  end

end
