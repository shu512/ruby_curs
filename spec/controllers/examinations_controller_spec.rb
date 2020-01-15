require 'rails_helper'

RSpec.describe ExaminationsController, type: :controller do
  test_group = FactoryBot.create(:group)
  test_discipline = FactoryBot.create(:discipline)
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
    subject { get :create, params: { examination: FactoryBot.build(:examination).attributes } }

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
    group = FactoryBot.create(:group)
    discipline = FactoryBot.create(:discipline)
    examination = FactoryBot.create(:examination)
    test_examination = { examination: { date: '2020-01-15 04:21:34',
                                        group_id: group.id,
                                        discipline_id: discipline.id },
                         id: examination.id }
    subject { get :update, params: test_examination }

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
end
