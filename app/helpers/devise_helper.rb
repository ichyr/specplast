module DeviseHelper
	# def bootstrap_class_for flash_type
 #    { success: "alert-success",
 #    	error: "alert-error",
 #      alert: "alert-warning", 
 #    	notice: "alert-info" }[flash_type] || flash_type.to_s
 #  end

 #  def flash_messages(opts = {})
 #    capture do
 #      flash.each do |msg_type, message|
 #        concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
 #          concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
 #          concat message 
 #        end)
 #      end
 #      nil
 #    end
 #  end

  def devise_error_messages!
    
    return "" if resource.errors.empty?
    
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    
    html = <<-HTML
      <div class="alert alert-danger alert-block">
        #{messages}
      </div>
     HTML

	  html.html_safe
  end
end