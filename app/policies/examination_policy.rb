class ExaminationPolicy
  attr_reader :user, :examination

  def initialize(user, examination)
    @user = user
    @examination = examination
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
