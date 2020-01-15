class QuestionPolicy
  attr_reader :user, :question

  def initialize(user, question)
    @user = user
    @question = question
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
