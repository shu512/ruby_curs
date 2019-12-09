module ExaminationsHelper
  # return array: [[discipline_name, discipline_id], ..]
  def disciplines_to_a
    Discipline.all.map do |i|
      [].push(i.title, i.id)
    end
  end

  def random_questions
    questions = @discipline.questions.map(&:content)
    selected_questions = []
    while selected_questions.size != 3
      rnd = rand(0...questions.size)
      selected_questions.push(rnd) unless selected_questions.include? rnd
    end
    selected_questions
  end
end
