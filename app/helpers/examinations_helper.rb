module ExaminationsHelper
  # return array: [[discipline_name, discipline_id], ..]
  def disciplines_to_a
    Discipline.all.map do |i|
      [].push(i.title, i.id)
    end
  end
end
