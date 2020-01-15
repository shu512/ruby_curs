class StudentPolicy
  attr_reader :user, :student

  def initialize(user, student)
    @user = user
    @student = student
  end

  def create?
    user.admin? unless user.nil?
  end

  def update?
    user.admin? unless user.nil?
  end

  def destroy?
    user.admin? unless user.nil?
  end
end
