Given(/^I see index page$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content (I18n.t "layout.title")
end

Given(/^I have (\d+) specializations in database$/) do |arg1|
  (1..arg1.to_i).each { |index|
  	a = SpecializationService.new.create_name "Спеціалізація #{index.to_s}"
    CreateSpecdataService.new.call a.id
  }
end

Then(/^I should see (\d+) links to specializations$/) do |arg1|
  Specialization.all.each { |spec| 
    href = specialization_url spec
    expect(page).to have_link(spec.name, {href: href})
  }
end

Then(/^I should see (\d+) avatars to specializations$/) do |arg1|
  expect(all("img").count).to eq(Specialization.count)
end

When(/^I click on specific link$/) do
	@specific = Specialization.last
  click_link(@specific.name)
end

Then(/^I should see corresponding specialization page$/) do
  uri = URI.parse(current_url)
  href = url_for @specific
	expect(uri.path).to eq(href)
end

Given(/^I have no specializations in bd$/) do
  Specialization.destroy_all
end

Then(/^I should see message "(.*?)"$/) do |arg1|
  expect(page).to have_content I18n.t('layout.no_specializations')
end

When(/^I click on specific avatar$/) do
	@specific = Specialization.last
  click_link(@specific.name)
end
