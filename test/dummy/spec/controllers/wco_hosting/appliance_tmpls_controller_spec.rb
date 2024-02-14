
RSpec::describe WcoHosting::ApplianceTmplsController do
  render_views
  routes { WcoHosting::Engine.routes }

  before do
    destroy_every( WcoHosting::ApplianceTmpl )
    setup_users
    @tmpl = create( :appliance_tmpl )
  end

  it '#create' do
    n = WcoHosting::ApplianceTmpl.all.count
    post :create, params: { tmpl: {
      kind: 'a',
      version: '0.0.0',
      image: 'b',
      volume_zip: 'c',
    } }
    WcoHosting::ApplianceTmpl.all.count.should eql( n + 1 )
  end

  it '#edit' do
    get :edit, params: { id: @tmpl.id }
    response.code.should eql '200'
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

