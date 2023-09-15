require 'selenium-webdriver'

def setup_driver(driver_name, binary_path = nil)
  Capybara.register_driver driver_name do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')

    options.binary = binary_path if binary_path

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = driver_name
  Capybara.default_driver = driver_name
end

if RUBY_PLATFORM =~ /darwin/ # Checks if the OS is MacOS
  setup_driver(:custom_chrome, '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome')
else
  setup_driver(:other_platform)
end
