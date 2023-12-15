require 'spec_helper'

describe WcoEmail::EmailConversationsController, :type => :controller do

  render_views
  routes { WcoEmail::Engine.routes }

  describe "#index" do
    before do
      User.all.destroy_all
      user = User.create!( email: 'victor@wasya.co', password: 'test1234', provider: 'keycloakopenid' )
      Wco::Profile.all.destroy_all
      p = Wco::Profile.create!( email: user.email )
      sign_in user
    end

    it 'does' do
      get :index
      response.code.should eql '200'
    end
  end

end

