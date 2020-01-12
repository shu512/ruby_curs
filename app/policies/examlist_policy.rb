class ExamlistPolicy
  attr_reader :user, :examlist

  def initialize(user, examlist)
    @user = user
    @examlist = examlist
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
