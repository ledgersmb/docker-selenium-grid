#filename: grid.rb

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

capabilities = [ Selenium::WebDriver::Remote::Capabilities.firefox, Selenium::WebDriver::Remote::Capabilities.chrome, Selenium::WebDriver::Remote::Capabilities.phantomjs]
title = 'LedgerSMB 1.6.0-dev'

def setup(capability='firefox')
 @driver = Selenium::WebDriver.for(
   :remote,
   :url => 'http://grid-server:4422/wd/hub',
   :desired_capabilities => capability) # you can also use :chrome, :safari, etc.
end

def teardown
 @driver.quit
end

def run(capability)
 setup(capability)
 yield
 teardown
end

for capability in capabilities
  run(capability) do
  @driver.get 'http://ledgersmb-vm:5000/login.pl'
   expect(@driver.title).to eq(title)
  puts (capability.browser_name + ': ' + (@driver.title == title ? 'Ok' : 'Failed'))
  end
end
