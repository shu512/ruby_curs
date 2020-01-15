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
    subject { get :create, params: { discipline: FactoryBot.build(:discipline).attributes } }

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
    discipline = FactoryBot.create(:discipline)
    test_discipline = { id: discipline.id }
    subject { get :destroy, params: test_discipline }

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
