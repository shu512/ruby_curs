require 'rails_helper'

RSpec.describe ExamlistsController, type: :controller do
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
    subject do
      group = FactoryBot.create(:group)
      student = FactoryBot.create(:student)
      discipline = FactoryBot.create(:discipline)
      examination = FactoryBot.create(:examination)
      examlist = FactoryBot.build(:examlist)
      get :create, params: { examlist: FactoryBot.attributes_for(:examlist) }
    end

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
    subject do
      group = FactoryBot.create(:group)
      discipline = FactoryBot.create(:discipline)
      student = FactoryBot.create(:student)
      examination = FactoryBot.create(:examination)
      examlist = FactoryBot.create(:examlist)
      get :update, params: { examlist: examlist.attributes, id: examlist.id }
    end

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

  describe '#destroy' do
    subject do
      group = FactoryBot.create(:group)
      student = FactoryBot.create(:student)
      discipline = FactoryBot.create(:discipline)
      examination = FactoryBot.create(:examination)
      examlist = FactoryBot.create(:examlist)
      get :destroy, params: { id: examlist.id }
    end

    context 'no login' do
      it { is_expected.to redirect_to '/users/sign_in' }
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
