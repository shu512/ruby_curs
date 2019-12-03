module StudentsHelper
  def fill_avaliable_groups
    @avaliable_groups = []
    Group.all.each do |i|
      arr = [].push(i.name, i.id)
      @avaliable_groups.push(arr)
    end
  end
end
