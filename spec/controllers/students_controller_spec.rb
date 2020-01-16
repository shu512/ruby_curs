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
    subject do
      group = FactoryBot.create(:group)
      get :create, params: { student: FactoryBot.attributes_for(:student) }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:student).id }
    end
  end

  describe '#update' do
    subject do
      group = FactoryBot.create(:group)
      student = FactoryBot.create(:student)
      get :update, params: { student: student.attributes, id: student.id }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:student).id }
    end
  end

  describe '#destroy' do
    subject do
      group = FactoryBot.create(:group)
      student = FactoryBot.create(:student)
      get :destroy, params: { id: student.id }
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
      it { is_expected.to redirect_to action: :index }
    end
  end
end
