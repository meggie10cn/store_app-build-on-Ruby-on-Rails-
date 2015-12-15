class Buyer < ActiveRecord::Base
        MAX_LENGTH_USERNAME = 30
        MIN_LENGTH_PASSWORD =  4
        MAX_LENGTH_PASSWORD = 20
        MIN_LENGTH_QUESTION =1
        MIN_LENGTH_ANSWER = 1
        MAX_LENGTH_ANSWER =30
        PASSWORD_RANGE = MIN_LENGTH_PASSWORD..MAX_LENGTH_PASSWORD
        ANSWER_RANGE=MIN_LENGTH_ANSWER..MAX_LENGTH_ANSWER
        
        validates_uniqueness_of :username
        validates_length_of :username,
        :maximum => MAX_LENGTH_USERNAME
        validates_length_of :password,
        :within => PASSWORD_RANGE
        #validates_length_of :sanswer1,
        #   :within => ANSWER_RANGE
        
        #validates_length_of :sanswer2,
        #   :within => ANSWER_RANGE
        
        validates :sanswer1, presence: true
        validates :sanswer2, presence: true
        validates :sanswer3, presence: true
        
        validates :squestion1, presence: true
        validates :squestion2, presence: true
        validates :squestion3, presence: true
        
        # validates_length_of :squestion1,
        #     :minimum => MIN_LENGTH_QUESTION
        
        # validates_length_of :squestion2,
        #    :minimum => MIN_LENGTH_QUESTION
        
        # validates_length_of :squestion3,
        #    :minimum => MIN_LENGTH_QUESTION
        
        validates_format_of :username,
        :with => /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\z/,
        :message => "It is not a valid email address."

end
