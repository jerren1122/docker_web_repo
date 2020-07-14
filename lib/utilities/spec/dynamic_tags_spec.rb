require 'rspec'
include RSpec
require './dynamic_tags.rb'

describe 'dynamic_spec' do
  before do
    @one = Splitter.new
  end

  it 'can iterate through multiple feature files returning a consolidated array' do
    expect(@one.feature_iterator('./spec/data').length).to eq 4
  end
  it 'can find all of the strings that match the given construct' do
    expect(@one.return_all_gherkin_scenarios('./spec/data/borrowing.feature').length).to eq 2
  end

  describe 'can divide the total number of tests up by the total number of executors' do
    it 'can handle an uneven split correctly' do
      allow(@one).to receive(:total_builds).and_return(3)
      scenarios = @one.feature_iterator('./spec/data')
      expect(@one.job_splitter(scenarios).length).to eq 3
      expect(@one.job_splitter(scenarios).flatten.length).to eq 4
    end

    it 'can handle an even split correctly' do
      allow(@one).to receive(:total_builds).and_return(4)
      scenarios = @one.feature_iterator('./spec/data')
      expect(@one.job_splitter(scenarios).length).to eq 4
      expect(@one.job_splitter(scenarios).flatten.length).to eq 4
    end
  end

  it 'can assign this individual suite a set of tests that correspond to its order' do
    allow(@one).to receive(:total_builds).and_return(3)
    allow(@one).to receive(:build_number).and_return(2)
    scenarios = @one.feature_iterator('./spec/data')
    splits = @one.job_splitter(scenarios)
    expect(@one.job_assigner(splits).length).to eq 1
  end

  it 'can then modify those tests titles so that the new tagging is met' do
    allow(@one).to receive(:total_builds).and_return(3)
    allow(@one).to receive(:build_number).and_return(2)
    scenarios = @one.feature_iterator('./spec/data')
    splits = @one.job_splitter(scenarios)
    assignment = @one.job_assigner(splits)
    expect(@one.feature_mod_iterator(assignment, './spec/data', false).length).to eq 2
  end

  it 'can handle parenthesis in regular expressions' do
    expect(@one.regex_generation("Checking Validation (Good)").to_s).to eq "(?-mix:Checking Validation \\(Good\\))"
  end
end
