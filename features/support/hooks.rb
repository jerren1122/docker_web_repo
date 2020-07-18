Before do |scenario|
  if browser_executable_location
    Selenium::WebDriver::Chrome.path = browser_executable_location
  end
  options = Selenium::WebDriver::Chrome::Options.new
  if driver_executable_location
    Selenium::WebDriver::Chrome::Service.driver_path = driver_executable_location
  end
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.headless!
  @browser = Watir::Browser.new(:chrome, {options: options})
  @browser.goto('http://webdriveruniversity.com/index.html')
  # todo run compose utilizing docker stack on a distributed ecosystem
  # todo play with volumes
  # todo change repo to public and remove security token for github in dockerfile
end