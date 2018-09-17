class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  scope :from_public_questions, -> {joins(:question).where(questions: {private: false})}

end
