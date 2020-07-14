Before do |scenario |
  Selenium::WebDriver::Chrome.path = browser_executable_location
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.add_argument('--no-sandbox')
  chrome_options.add_argument('--disable-dev-shm-usage')
  chrome_options.headless!
  @browser = Watir::Browser.new(:chrome, {options: options})
  @browser.goto('https://www3.mtb.com/')

end