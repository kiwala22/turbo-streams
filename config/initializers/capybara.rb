require 'selenium-webdriver'

Capybara.register_driver :custom_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless') # Run Chrome in headless mode
  options.add_argument('--disable-gpu') # Disable GPU usage for headless mode
  options.binary = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' # Replace with the actual path to Chrome binary

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :custom_chrome
Capybara.default_driver = :custom_chrome
