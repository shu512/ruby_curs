require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe '#create' do
    subject do
      discipline = FactoryBot.create(:discipline)
      discipline_id = { discipline_id: discipline.id }
      question = { question: FactoryBot.build(:question).attributes }
                 .merge(discipline_id)
      get :create, params: question
    end

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
    subject do
      discipline = FactoryBot.create(:discipline)
      question = FactoryBot.create(:question)
      get :update, params: { question: question.attributes,
                             id: question.id,
                             discipline_id: discipline.id }
    end

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

  describe '#destroy' do
    subject do
      discipline = FactoryBot.create(:discipline)
      question = FactoryBot.create(:question)
      get :destroy, params: { id: question.id, discipline_id: discipline.id }
    end

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
