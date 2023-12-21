
RSpec::describe WcoHosting::ServerhostsController do
  render_views
  routes { WcoHosting::Engine.routes }

  before do
    User.all.destroy_all
    @user = create( :user, email: 'piousbox@gmail.com' )
    sign_in @user
  end

  it '#index' do
    get :index
    response.code.should eql '200'
  end

end

