class GhibiliService
  def all_films
    response = Faraday.get("https://ghibliapi.herokuapp.com/films")
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_people
    response = Faraday.get("https://ghibliapi.herokuapp.com/people")
    JSON.parse(response.body, symbolize_names: true)
  end

  def film(film_url)
    response = Faraday.get(film_url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
