class DisciplinePolicy
  attr_reader :user, :discipline

  def initialize(user, discipline)
    @user = user
    @discipline = discipline
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
