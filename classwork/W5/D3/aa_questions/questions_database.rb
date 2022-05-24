require 'singleton'
require 'sqlite3'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true 
    self.results_as_hash = true 
  end 
end





class User

  attr_accessor :id, :fname, :lname 

  def self.find_by_name(fname, lname)
    QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM 
        users
      WHERE 
        fname = ? AND lname = ?
    SQL
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        users
      WHERE 
        users.id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        title, body
      FROM 
        questions
      JOIN question_followers ON questions.id = question_followers.question_id
      WHERE question_followers.user_id = ?
    SQL
    data = data.map { |datum| Question.new(datum) }
  end

end







class Question

  attr_accessor :id, :title, :body

  def replies
    Reply.find_by_question_id(self.id)
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    Select
      *
    FROM
      users
    WHERE
      users.id = (
        SELECT
          user_id
        FROM
          question_follows
        WHERE
          question_id = ?
      )
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        *
      FROM
        questions
      WHERE 
        questions.id IN (SELECT question_id FROM question_follows WHERE user_id = ?)
    SQL
    data.map { |datum| Question.new(datum) }
  end
  
  def self.find_by_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM 
      questions 
    WHERE 
      questions.id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end
  
  def create
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
    INSERT INTO
      questions (title, body)
    VALUES
      (?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update
    raise "#{self} not in database" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.id)
    UPDATE
      questions
    SET
      title = ?, body = ?
    WHERE
      id = ?
    SQL
  end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
  end

  def followers
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT 
        fname, lname
      FROM 
        users
      JOIN question_followers ON users.id = question_followers.user_id
      WHERE question_followers.question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end
end





class QuestionFollow
  
  attr_accessor :id, :user_id, :question_id

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM 
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE 
        question_id = ? 
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        question_follows
      WHERE 
        question_follows.id = ?
    SQL
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end
  
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end





class Reply

  attr_accessor :id, :user_id, :question_id, :parent_id, :body

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        *
      FROM
        replies
      WHERE 
        user_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM
        replies
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        replies.id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

  def author 
    data = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
      SELECT 
        *
      FROM 
        users
      WHERE 
        users.id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def question 
    data = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
      SELECT 
        *
      FROM 
        questions
      WHERE 
        questions.id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def parent_reply
    data = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
end






class QuestionLike

  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM 
        question_likes 
      WHERE 
        question_likes.id = ?
    SQL
    data.map { |datum| QuestionLike.new(datum) }
  end
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end



class QuestionFollowers
  attr_accessor :id, :user_id, :question_id
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_followers")
    data.map { |datum| QuestionFollowers.new(datum) }
  end

  def followers_for_question_id
    data = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
    SELECT
      fname, lname
    FROM
      users
    JOIN
      question_followers
        ON
          users.id = question_followers.user_id
    WHERE
      question_followers.question_id = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def followed_questions_for_user_id
    data = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
    SELECT
      title, body
    FROM
      questions
    JOIN
      question_followers
        ON 
          questions.id = question_followers.question_id
    WHERE
      question_followers.user_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end
end