class GroupPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
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
