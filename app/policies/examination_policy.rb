class ExaminationPolicy
  attr_reader :user, :examination

  def initialize(user, examination)
    @user = user
    @examination = examination
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
