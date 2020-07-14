Before do |scenario |
  Selenium::WebDriver::Chrome.path = browser_executable_location
  options = Selenium::WebDriver::Chrome::Options.new
  Selenium::WebDriver::Chrome::Service.driver_path = driver_executable_location
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.headless!
  @browser = Watir::Browser.new(:chrome, {options: options})
  @browser.goto('https://www3.mtb.com/')

end