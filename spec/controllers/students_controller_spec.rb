require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#index' do
    subject { get :index }
    context 'no login' do
      it { is_expected.to have_http_status(:ok) }
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
    subject { get :create, params: { student: FactoryBot.build(:student).attributes } }

    context 'no login' do
      it { is_expected.to redirect_to '/' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to action: :show, id: assigns(:student).id }
    end
  end

  describe '#update' do
    group = FactoryBot.create(:group)
    student = FactoryBot.create(:student)
    test_student = { student: { number: 1, full_name: 'test' }, id: student.id }
    subject { get :update, params: test_student }

    context 'no login' do
      it { is_expected.to redirect_to '/' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to have_http_status :ok }
    end
  end

  describe '#destroy' do
    student = FactoryBot.create(:student)
    test_student = { id: student.id }
    subject { get :destroy, params: test_student }

    context 'no login' do
      it { is_expected.to redirect_to '/' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to action: :index }
    end
  end
end
