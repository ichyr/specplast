Given(/^I am logged in as administrator$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^there are no specializations$/) do
  Specializations.destroy_all
end

When(/^I visit specialization creation page$/) do
  visit new_specialization_path
end

When(/^I set image to be uploaded$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^thumb of this image must be loaded into creation page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I create new specialization$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I get notice$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^specialization is created$/) do
  expect(Specializations.count).to eq(1)
end

Given(/^I am logged in as moderator$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I get error message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^specialization is not created$/) do
  expect(Specializations.count).to eq(0)
end

Given(/^I am logged in as user$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^there is one specialization$/) do
  SpecializationService.new.create
end

When(/^I delete this specialization$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^specialization is deleted$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^specialization is not deleted$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit this specialization$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I save the changes$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see those changes in specialization$/) do
  pending # express the regexp above with the code you wish you had
end
