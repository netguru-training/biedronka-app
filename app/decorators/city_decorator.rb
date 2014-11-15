class CityDecorator < Draper::Decorator
  delegate_all

  def lorem
    'ipsum'
  end

end
