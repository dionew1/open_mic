require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_jokes
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_learn_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_equal [joke], sal.jokes
  end

  def test_tell_joke
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)
    sal.tell(ali, joke)

    assert_equal [joke], ali.jokes
  end

  def test_tell_joke_ali_joke_count
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)
    sal.tell(ali, joke)

    assert_equal 1, ali.jokes.count
  end

  def test_illana_routine
    illana = User.new("Illana")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    illana.learn(joke_1)
    illana.learn(joke_2)
    illana.perform_routine_for(josh)

    assert_equal [joke_1, joke_2], josh.jokes
  end

  def test_josh_joke_count
    illana = User.new("Illana")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    illana.learn(joke_1)
    illana.learn(joke_2)
    illana.perform_routine_for(josh)

    assert_equal 2, josh.jokes.count
  end

  def test_user_learn_routine
    casey = User.new("Casey")
    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
  end

end
