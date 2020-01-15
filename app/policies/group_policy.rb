class GroupPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
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
