module DeviseHelper
  def bootstrap_alert(key)
    case key
    when 'alert'
      'danger'
    when 'notice'
      'primary'
    when 'error'
      'warning'
    end
  end

  def switch_flash(existing_key, new_key)
    message = flash[existing_key].dup
    flash.discard existing_key
    flash[new_key] = message
  end
end
