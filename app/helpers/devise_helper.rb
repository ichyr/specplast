module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    
    messages = I18n.t "simple_form.error_notification.default_message"

    messages = "<b>#{messages}</b>"

    messages += resource.errors.full_messages.
                map { |msg| content_tag(:li, msg) }.join
    
	  messages.html_safe
  end
end