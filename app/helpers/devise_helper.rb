module DeviseHelper
  def devise_error_messages!
    resource.errors.full_messages.each do |msg|
      content_tag(:div, :class => "alert-error") do
        msg
      end
    end
  end

  def devise_error_messages2!
    resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
  end
end