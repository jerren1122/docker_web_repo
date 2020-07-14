class Splitter
  def total_builds
    ENV['total_number_of_builds'].to_i
  end

  def build_number
    ENV['build_number'].to_i
  end

  def main_run
    scenarios = feature_iterator
    splits = job_splitter(scenarios)
    assignment = job_assigner(splits)
    feature_mod_iterator(assignment, 'features', true)
  end

  def regex_generation(value)
    par_mod = value.gsub('(', '\(').gsub(')', '\)')
    regex = /#{par_mod}/
  end

  def feature_mod_iterator(split_assignment, current_location = 'features', assign = true)
    array = []
    split_assignment.each do |value|
      mod_value = value.gsub('@regression', '@split_builds')
      regex = /#{value}$/
      files = return_all_files(current_location, '*', 'feature')
      files.each do |file|
        output = File.open(file, 'r', &:read)
        modified = output.gsub(regex, mod_value)
        if assign
          File.open(file, 'w+') { |f| f.print(modified) }
        else
          array.push(modified)
        end
      end
    end
    array
  end

  def feature_iterator(current_location = 'features')
    files = return_all_files(current_location, '*', 'feature')
    array = []
    files.each do |file|
      array.push(return_all_gherkin_scenarios(file))
    end
    array.flatten
  end

  def return_all_gherkin_scenarios(file)
    output = File.open(file, 'r', &:read)
    output.scan(/(@regression.*\n. (Scenario:|Scenario Outline:)?.*)/).map { |value| value[0] }
  end

  def return_all_files(current_location, filter = '*', file_type = '*')
    Dir.glob("#{current_location}/**/#{filter}.#{file_type}")
  end

  def job_splitter(scenarios)
    split = scenarios.length.to_i / total_builds.to_i

    container = []
    total_builds.times { container.push([]) }
    mod_scenarios = scenarios.clone

    total_builds.times do |index|
      container[index].push(mod_scenarios[0..(split - 1)])
      container[index].flatten!

      (0..(split - 1)).to_a.length.times do
        mod_scenarios.delete_at(0)
      end
    end

    mod_scenarios.each_with_index do |value, index|
      container[index].push(value)
    end
    container
  end

  def job_assigner(scenarios)
    scenarios[(build_number.to_i - 1)]
  end
end
#
# one = Splitter.new
# one.main_run