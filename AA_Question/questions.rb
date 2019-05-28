require 'sqlite3'
require 'singleton'

class Questionsconnection < sqlite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class user
  def self.all
    data = Questionsconnection.instance.executes('SELECT * FROM users')
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id
    questions_data = QuestionsDatabase.execute(<<-SQL, fname, lname)
    SELECT
      id
    FROM
      users
  
    SQL
  end

  def self.find_by_name(fname, lname)
    
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fanme']
    @lname = options['lname']
  end

  
