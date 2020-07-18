require '../utilities/valid_output'
describe 'valid output' do

  it 'can parse input date/time from variables received from the command line' do
    @check = ValidOutput.new("Sat 07/18/2020", "8:36:25.32")
    expect(@check.parse_starting_time.to_s).to eq '2020-07-18 08:36:25 -0400'
  end

  it 'can parse input date/time from the file into a date object' do
    @check = ValidOutput.new("Sat 07/18/2020", "8:36:25.32")
    expect(@check.parse_file_time("./spec/data/time_flies.txt").to_s).to eq "2020-07-18 09:04:49 -0400"
  end

  describe 'object comparison' do
    it 'can pass when all files are made after the input times' do
      @check = ValidOutput.new("Sat 07/18/2020", "8:36:25.32")
      expect(@check.check_times('./spec/data/happy_path_file_repo')).to eq true
    end

    it 'fails when any file is made before the input times' do
      @check = ValidOutput.new("Sat 07/18/2020", "9:36:25.32")
      expect{@check.check_times('./spec/data/happy_path_file_repo')}.to raise_error(RuntimeError)
    end

    it 'fails if there are no results in the output' do
      @check = ValidOutput.new("Sat 07/18/2020", "9:36:25.32")
      expect{@check.check_times('../lib/helpers')}.to raise_error(RuntimeError)
    end
  end
end