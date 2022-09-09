module FlashHelper
  def css_class(type)
    case type.to_sym
    when :alert
      'bg-red-500'
    else
      'bg-green'
    end
  end
end
