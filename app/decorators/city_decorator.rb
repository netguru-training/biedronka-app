class CityDecorator < BaseDecorator
  delegate_all

  def lorem
    'ipsum'
  end

end
