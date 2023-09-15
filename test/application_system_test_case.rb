# require "test_helper"
# require 'selenium-webdriver'

# class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
#   # Replace '/path/to/chrome/binary' with the actual path to Chrome binary
#   # chrome_options = Selenium::WebDriver::Chrome::Options.new(binary: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome')
#   # driver = Selenium::WebDriver.for :chrome, options: chrome_options
#   # driven_by :selenium_chrome, using: :chrome, screen_size: [1400, 1400]

#   driven_by :selenium, using: :chrome, options: {
#     binary: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
#     args: ['--headless', '--disable-gpu'],
#     screen_size: [1400, 1400]
#   }
# end

require "test_helper"
require 'selenium-webdriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers
  
  if RUBY_PLATFORM =~ /darwin/ # Check if the OS is MacOS
    driven_by :custom_chrome
  else
    # For Linux (and other OSes), use the default Selenium driver
    driven_by :other_platform
  end
end


