module ExaminationsHelper
  def fill_avaliable_disciplines
    avaliable_disciplines = []
    Discipline.all.each do |i|
      arr = [].push(i.title, i.id)
      avaliable_disciplines.push(arr)
    end
    avaliable_disciplines
  end
end
