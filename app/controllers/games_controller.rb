require "open-uri"

class GamesController < ApplicationController
  def new
    # display a new random grid
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    # The form will be submitted (with POST) to the score action.
    @guess = params[:guess]
    @letters = params[:letters].split
    @included = wordincluded?(@guess, @letters)
    @english_word = english_word?(@guess)
  end

private
  def wordincluded?(guess, letters)
    guess.chars.all? do |letter|
      guess.count(letter) <= letters.count(letter)
    end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
