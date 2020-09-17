require 'faraday'
require 'pry'
require 'json'
require './film'
require './person'
require './ghibili_service'

class Ghibili
  def show_all_films
    json = GhibiliService.new.all_films

    films = json.map do |film_hash|
      Film.new(film_hash)
    end

    films.each do |film|
      puts film.title
    end
  end

  def show_all_people
    json = GhibiliService.new.all_people

    people = json.map do |people_hash|
      Person.new(people_hash)
    end

    people.each do |person|
      puts person.name
      puts 'films they appear in:'
      person.films.each do |film|
        puts film.title
      end
      puts "================="
    end
  end
end

Ghibili.new.show_all_films
Ghibili.new.show_all_people
