require 'rails_helper'

RSpec.describe ExamlistsController, type: :controller do
  group = FactoryBot.create(:group)
  discipline = FactoryBot.create(:discipline)
  student = FactoryBot.create(:student)
  test_examination = FactoryBot.create(:examination)
  describe '#index' do
    subject { get :index }
    context 'no login' do
      it { is_expected.to have_http_status(:redirect) }
    end

    context 'login as user' do
      login_user
      it { is_expected.to have_http_status(:ok) }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to have_http_status(:ok) }
    end
  end

  describe '#create' do
    subject { get :create, params: { examlist: FactoryBot.build(:examlist).attributes } }

    context 'no login' do
      it { is_expected.to redirect_to '/users/sign_in' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to action: :show, id: assigns(:examlist).id }
    end
  end

  describe '#update' do
    examlist = FactoryBot.create(:examlist)
    test_examlist = { examlist: { student_id: 1,
                                  examination_id: 1,
                                  mark: 1 },
                      id: examlist.id }
    subject { get :update, params: test_examlist }

    context 'no login' do
      it { is_expected.to redirect_to '/users/sign_in' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to action: :show, id: assigns(:examlist).id }
    end
  end
end
