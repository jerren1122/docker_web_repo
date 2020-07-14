Before do |scenario |
  options = Selenium::WebDriver::Chrome::Options.new
  options.headless!
  @browser = Watir::Browser.new(:chrome, {options: options})
  @browser.goto('https://www3.mtb.com/')

end