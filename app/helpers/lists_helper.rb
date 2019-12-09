module ListsHelper
  # return array: [[discipline_name, discipline_id], ..]
  def examinations_to_a
    Examination.all.map do |i|
      #group = 
      #discipline = 
      [].push(i.group_id, i.id)
    end
  end

  def examination_by_id(id)
    Examination.find(id)
  end

  def discipline_by_id(id)
    Discipline.find(id)
  end

  def group_by_id(id)
    Group.find(id)
  end
end
