require 'capybara_helper'

RSpec.feature 'Action cable', type: :feature do
  context 'when real rate updates', js: true do
    it 'updates rate on #show page' do
      Sidekiq::Testing.inline! do
        visit root_path
        expect(page).to have_text 'isn\'t set yet'
        expect(page).not_to have_text '80'
        allow_any_instance_of(RateService).to receive(:rate_from_api).and_return(80)
        UpdateRateJob.perform_later
        expect(page).to have_text '80'
      end
    end
  end

  context 'when forced rate changes', js: true do
    let!(:rate) { create :rate, value: 50 }

    it 'displays actual rate' do
      Sidekiq::Testing.disable! do
        visit root_path
        expect(page).to have_text '50'
        within_window open_new_window do
          visit admin_path
          expect(page).to have_text 'Please, enter a new forced rate'
          fill_in 'Value', with: '80'
          fill_in 'Expiry time in UTC', with: Time.zone.now.utc + 5.seconds
          click_on 'Create Forced rate'
          expect(page).to have_text 'Forced rate succesfuly saved!'
        end
        switch_to_window(windows.first)
        expect(page).to have_text '80'
        sleep 10
        expect(page).to have_text '50'
      end
    end
  end
end
