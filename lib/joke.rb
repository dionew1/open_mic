class Joke

  attr_reader :id, :question, :answer

  def initialize(joke)
    @id = joke.fetch(:id)
    @question = joke.fetch(:question)
    @answer = joke.fetch(:answer)
  end


end
