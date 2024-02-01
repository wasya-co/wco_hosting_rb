
RSpec::describe WcoHosting::ServerhostsController do
  render_views
  routes { WcoHosting::Engine.routes }

  before do
    setup_users
  end

  it '#new' do
    get :new
    response.code.should eql '200'
  end

  it '#index' do
    get :index
    response.code.should eql '200'
  end

end

