module PageHelper

  def page_class_name_for(page_name)
    page_name = page_name.split(' ').map(&:capitalize).join(' ')
    Kernel.const_get(page_name.split(' ').collect { |a| (a =~ /\A\z/i ? a.upcase : a.capitalize) }.join('') + 'Page')
  end

  def browser_executable_location
    ENV['browser_executable_location'].nil? ? false : ENV['browser_executable_location']
  end

  def to_element(element)
      @current_page.instance_eval("#{element.gsub(' ', '_').gsub('/', '.').downcase}_element")
  end

  def driver_executable_location
    ENV['driver_executable_location'].nil? ? false : ENV['driver_executable_location']
  end


end