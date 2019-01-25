require 'capybara/rspec'
require "app"
require 'birthday_calculator'

feature 'Calculates days left' do
  scenario 'should enter a name and return days left' do
    visit('/')
    fill_in :name, with: 'Debora'
    select '29', from: 'day'
    select 'April', from: 'month'
    click_on "Let's Go!"
    expect(page).to have_content 'Your Birthday is 94 days away, Debora!'
  end
end


RSpec.describe Birthday_calculator do

  context "#today" do
    it 'should return todays date in Julian' do
      date = Birthday_calculator.new("29", "04")
      expect(date.today).to eq 2458509
    end
  end

  context "#birthday" do
    it 'should return todays date in Julian' do
      date = Birthday_calculator.new("29", "04")
      p date.birthday
      expect(date.birthday).to eq 2458603
    end
  end

  context "#days_away" do
    it 'should return days away for birthday' do
      date = Birthday_calculator.new("29", "04")
      allow(date).to receive(:today).and_return 2458508
      p date.days_away
      expect(date.days_away).to eq 95
    end
    it "text" do

    end
  end

end
