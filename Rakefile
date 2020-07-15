require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

module RakeProfileHelper
  def self.setup_profile(task, name)
    task.profile = name
    FileUtils.mkdir_p(output_folder) unless File.exists?(output_folder)
    task.cucumber_opts = "#{run_folder} --retry #{rerun} --guess --color --verbose --format json --out '#{output_folder}'/cucumber.json --format html --out '#{output_folder + html_name}.html' #{or_tags}"
  end

  def self.output_folder
     "output/"
  end

  def self.rerun
    ENV['rerun'].nil? ? 0 : ENV['rerun']
  end

  def self.html_name
    "AutomationReport"
  end

  def self.run_folder
    ENV['run_folder'].nil? ? '' : ENV['run_folder']
  end

  def self.or_tags
    if ENV['or_tags'].nil?
      ''
    else
      or_tags_array = ENV['or_tags'].split(',').inject([]) { |arr, tag| arr << '@' + tag.strip; arr }
      " --tags '#{or_tags_array.join(' or ')}'"
    end
  end

end

namespace :features do
  Cucumber::Rake::Task.new(:default, 'Run features with Default task') do |t|
    RakeProfileHelper.setup_profile(t, 'default')
  end
end