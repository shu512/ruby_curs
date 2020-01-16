require 'rails_helper'

RSpec.describe ExaminationsController, type: :controller do
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
      discipline = FactoryBot.create(:discipline)
      examination = FactoryBot.build(:examination)
      get :create, params: { examination: FactoryBot.attributes_for(:examination) }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:examination).id }
    end
  end

  describe '#update' do
    subject do
      group = FactoryBot.create(:group)
      discipline = FactoryBot.create(:discipline)
      examination = FactoryBot.create(:examination)
      get :update, params: { examination: examination.attributes, id: examination.id }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:examination).id }
    end
  end

  describe '#destroy' do
    subject do
      group = FactoryBot.create(:group)
      discipline = FactoryBot.create(:discipline)
      examination = FactoryBot.create(:examination)
      get :destroy, params: { id: examination.id }
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
