require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
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
    subject { get :create, params: { group: FactoryBot.attributes_for(:group) } }

    context 'no login' do
      it { is_expected.to redirect_to '/' }
    end

    context 'login as user' do
      login_user
      it { is_expected.to redirect_to '/' }
    end

    context 'login as admin' do
      login_admin
      it { is_expected.to redirect_to action: :show, id: assigns(:group).id }
    end
  end

  describe '#update' do
    subject do
      group = FactoryBot.create(:group)
      get :update, params: { group: group.attributes, id: group.id }
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
      it { is_expected.to redirect_to action: :show, id: assigns(:group).id }
    end
  end

  describe '#destroy' do
    subject do
      group = FactoryBot.create(:group)
      get :destroy, params: { id: group.id }
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
