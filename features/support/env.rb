LIB_DIR = Dir.getwd + '/lib/helpers'
PAGES_DIR = Dir.getwd + '/pages'
$LOAD_PATH.unshift(PAGES_DIR, LIB_DIR)

require 'page-object'
require 'watir'
require 'rspec'
require 'page_helper'
include(PageHelper, PageObject::PageFactory)
require PAGES_DIR + '/base_page'
Dir["#{PAGES_DIR}**/*.rb"].each { |file| require file }

