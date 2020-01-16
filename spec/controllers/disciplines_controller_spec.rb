require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
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
      get :create, params: { discipline: FactoryBot.attributes_for(:discipline) }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:discipline).id }
    end
  end

  describe '#update' do
    subject do
      discipline = FactoryBot.create(:discipline)
      get :update, params: { discipline: discipline.attributes, id: discipline.id }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:discipline).id }
    end
  end

  describe '#destroy' do
    subject do
      discipline = FactoryBot.create(:discipline)
      get :destroy, params: { id: discipline.id }
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
