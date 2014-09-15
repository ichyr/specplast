Given(/^I see index page$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I have (\d+) specializations in database$/) do |arg1|
  (1..arg1.to_i).each { |index|
  	SpecializationService.new.create_name "Спеціалізація #{index.to_s}"
  }
end

Then(/^I should see (\d+) links to specializations$/) do |arg1|
  Specialization.all.each { |spec| 
      expect(page).to have_link(spec.name, {href: url_for(spec)})
  }
end

Then(/^I should see (\d+) avatars to specializations$/) do |arg1|
  expect(all("img").count).to eq(Specialization.count)
end

When(/^I click on specific link$/) do
	@specific = Specialization.count
	@specific = Specialization.find(@specific - 1).name
  click_link(@specific)
end

Then(/^I should see corresponding specialization page$/) do
  uri = URI.parse(current_url)
	expect(uri).to eq(specialization_path @specific)
end

Given(/^I have no specializations in bd$/) do
  Specialization.destroy_all
end

Then(/^I should see message "(.*?)"$/) do |arg1|
  expect(page).to have_content "В базі даних немає відомостей про жодну спеціалізацію"
end

When(/^I click on specific avatar$/) do
	Specialization.all.each {

	}
end
