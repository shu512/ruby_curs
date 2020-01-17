module ExaminationsHelper
  def random_questions
    questions = @discipline.questions.map(&:content)
    selected_questions = []
    while selected_questions.size != 3
      rnd = rand(0...questions.size)
      selected_questions.push(questions[rnd]) unless selected_questions.include? questions[rnd]
    end
    selected_questions
  end
end
