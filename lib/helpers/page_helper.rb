module PageHelper

  def page_class_name_for(page_name)
    page_name = page_name.split(' ').map(&:capitalize).join(' ')
    Kernel.const_get(page_name.split(' ').collect { |a| (a =~ /\A\z/i ? a.upcase : a.capitalize) }.join('') + 'Page')
  end

  def to_element(element)
      @current_page.instance_eval("#{element.gsub(' ', '_').gsub('/', '.').downcase}_element")
  end

end