require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  before :each do
    @client = Client.new
  end

  after :each do
    @client = Client.new
  end
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
    subject { get :create, params: { group: FactoryBot.build(:group).attributes } }

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
    group = FactoryBot.create(:group)
    test_group = { group: { name: 'qwe', size: 20 }, id: group.id }
    subject { get :update, params: test_group }

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
    group = FactoryBot.create(:group)
    test_group = { id: group.id }
    subject { get :destroy, params: test_group }

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
