class ExamlistPolicy
  attr_reader :user, :examlist

  def initialize(user, examlist)
    @user = user
    @examlist = examlist
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
