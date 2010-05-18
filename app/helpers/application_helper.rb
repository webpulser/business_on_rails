# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def label_with_required(form, label, method, errors, html_options={})
    l = label
    l += " #{t("required")}" unless errors.on(method).nil?
    return form.label method, l, html_options
  end
end
