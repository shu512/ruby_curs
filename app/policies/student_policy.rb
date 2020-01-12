class StudentPolicy
  attr_reader :user, :student

  def initialize(user, student)
    @user = user
    @student = student
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
