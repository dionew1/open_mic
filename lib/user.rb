class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    @jokes.map do |joke|
      tell(user, joke)
    end
  end

  def learn_routine(file)
    File.open(file).each_with_index do |line, index|
        next if index == 0
        @jokes << line
    end
  end

end
