class DisciplinePolicy
  attr_reader :user, :discipline

  def initialize(user, discipline)
    @user = user
    @discipline = discipline
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
