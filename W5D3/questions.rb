require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end

class User
    attr_accessor :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM users
            WHERE users.id = ?;
        SQL
        return nil if users.empty?
        User.new(users.first);
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT *
            FROM users
            WHERE fname = ? AND lname = ?
        SQL
        return nil if users.empty?
        User.new(users.first);
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
       Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end
end

class Question
    attr_accessor :title, :body, :author_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
        data.map { |datum| Question.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def self.find_by_id(id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM questions
            WHERE questions.id = ?;
        SQL
        return nil if questions.empty?
        Question.new(questions.first);
    end

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM questions
            WHERE questions.author_id = ?;
        SQL
        return nil if questions.empty?
        questions.map { |question| Question.new(question)}
    end

    def author
        User.find_by_id(self.author_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollow.followers_for_question_id(self.id)
    end
end

class QuestionFollow
    attr_accessor :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.find_by_id(id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM question_follows
            WHERE question_follows.id = ?;
        SQL
        return nil if question_follows.empty?
        QuestionFollow.new(question_follows.first);
    end

    def self.followers_for_question_id(question_id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT *
            FROM users
            JOIN question_follows ON users.id = question_follows.user_id
            WHERE question_follows.question_id = ?;
        SQL
        return nil if question_follows.empty?
        question_follows.map { |question| QuestionFollow.new(question)}
    end

    def self.followed_questions_for_user_id(user_id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT *
            FROM questions
            JOIN question_follows ON questions.id = question_follows.question_id
            WHERE question_follows.user_id = ?;
        SQL
        return nil if question_follows.empty?
        QuestionFollow.new(question_follows.first);
    end

    def self.most_followed_questions(n)
        most_followed = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT questions.title, COUNT(followers) AS followers_count
            FROM questions
            JOIN question_follows ON questions.id = question_follows.question_id
            GROUP BY questions.title
            ORDER BY followers_count DESC
            LIMIT n;
        SQL
        return nil if most_followed.empty?
        QuestionFollow.new(most_followed.first);
    end
end

class Reply
    attr_accessor :body, :author_id, :question_id, :parent_reply_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
        data.map { |datum| Reply.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @author_id = options['author_id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
    end

    def self.find_by_id(id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM replies
            WHERE replies.id = ?;
        SQL
        return nil if replies.empty?
        Reply.new(replies.first);
    end

    def self.find_by_user_id(author_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM replies
            WHERE replies.author_id = ?;
        SQL
        return nil if replies.empty?
        Reply.new(replies.first);
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT *
            FROM replies
            WHERE replies.question_id = ?;
        SQL
        return nil if replies.empty?
        Reply.new(replies.first);
    end

    def author 
        User.find_by_id(self.author_id)
    end

    def question
        Question.find_by_id(self.question_id)
    end

    def parent_reply
        Reply.find_by_id(self.parent_reply_id)
        return nil if parent_reply_id.nil?
    end

    def child_replies
        replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT *
            FROM replies
            WHERE parent_reply_id = @id
        SQL
        return "no replies" if replies.empty?
    end

end

class QuestionLikes
    attr_accessor :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
        data.map { |datum| QuestionLikes.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @queston_id = options['queston_id']
    end

    def self.find_by_id(id)
        question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM question_likes
            WHERE question_likes.id = ?;
        SQL
        return nil if question_likes.empty?
        QuestionLikes.new(question_likes.first);
    end

end

