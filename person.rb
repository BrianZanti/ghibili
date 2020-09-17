class Person
  attr_reader :name, :films

  def initialize(attributes)
    @name = attributes[:name]
    films = attributes[:films]
    @films = films.map do |film_url|
      film_data = GhibiliService.new.film(film_url)
      Film.new(film_data)
    end
  end
end
