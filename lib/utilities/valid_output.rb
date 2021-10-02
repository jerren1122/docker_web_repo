class ValidOutput
  require 'date'
  attr_reader(:starting_date, :starting_time)

  def initialize(starting_date, starting_time)
    @starting_date = starting_date
    @starting_time = starting_time

  end

  def parse_starting_time
    dv = (starting_date.split(' ')[1].split('/')).map(&:to_i)
    tv = (starting_time.split(':')).map(&:to_i)
    Time.new(dv[2], dv[0], dv[1], tv[0], tv[1], tv[2])
  end

  def parse_file_time(file_name)
    File.mtime(file_name)
  end

  def check_times(file_repo = '../../docker_output')
    start_time = parse_starting_time
    files = Dir.glob("./#{file_repo}/**/*.html")
    if files.length == 0
      raise "not looking at the correct path for the files"
    end
    files.each do |file|
      if start_time > parse_file_time(file)
        raise "Files are not valid from the copy from Docker portion"
      end
      print "start time is: " + start_time.to_s
      print "file time is: " + parse_file_time(file).to_s
    end
    true
  end
end
#
# one = ValidOutput.new(ARGV[0], ARGV[1])
# one.check_times