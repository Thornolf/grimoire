module ApplicationHelper
  def icon(name, options = {})
    options[:class] ||= ""
    file_path = "app/assets/images/#{name}.svg"

    if File.exist?(file_path)
      file = File.read(file_path)
      content_tag(:span, file.html_safe, options)
    else
      "(missing icon: #{name})"
    end
  end
end
