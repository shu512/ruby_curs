require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  merge_with_question = { discipline_id: 3 }
  test_discipline = FactoryBot.create(:discipline)
  test_question = { question: FactoryBot.build(:question).attributes }
                  .merge(merge_with_question)

  describe '#create' do
    subject { get :create, params: test_question }

    context 'no login' do
      it { is_expected.to redirect_to '/' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to '/disciplines/1' }
    end
  end

  describe '#update' do
    merge_with_question = { discipline_id: 3 }
    test_discipline = FactoryBot.create(:discipline)

    question = FactoryBot.create(:question)
    id = Question.all.last.id
    discipline_id = Question.all.last.discipline_id

    test_question = { question: { content: 'qwe' }, id: id, discipline_id: discipline_id }

    subject { get :update, params: test_question }

    context 'no login' do
      it { is_expected.to redirect_to '/' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to '/disciplines/1' }
    end
  end
end
