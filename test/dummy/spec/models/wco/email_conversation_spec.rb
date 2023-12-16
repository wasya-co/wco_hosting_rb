
RSpec.describe Wco::EmailConversation, type: :model do

  it 'sanity' do
    m = Wco::EmailConversation.create
    m.persisted?.should eql true
  end

end

