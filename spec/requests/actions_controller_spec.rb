require 'rails_helper'

describe TrustLevelGroups::ActionsController do
  before do
    SiteSetting.queue_jobs = false
  end

  it 'can list' do
    sign_in(Fabricate(:user))
    get "/trust-level-groups/list.json"
    expect(response.status).to eq(200)
  end
end
