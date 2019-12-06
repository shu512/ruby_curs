module StudentsHelper
  # return array: [[group_name, group_id], ..]
  def groups_to_a
    Group.all.map do |i|
      [].push(i.name, i.id)
    end
  end
end
