class UserDecorator < Draper::Decorator
  delegate_all

  def humanize_name
    email unless first_name.present? && last_name.present?
    "#{first_name} #{last_name}"
  end

end
