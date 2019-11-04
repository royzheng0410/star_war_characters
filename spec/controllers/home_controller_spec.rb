require 'rails_helper'

describe HomeController, :type => :controller do 
  render_views
  before do
    @person1 = FactoryGirl.create :person
    @person2 = FactoryGirl.create :person
    @person2 = FactoryGirl.create :person
  end

  describe '#index' do
    it 'should list all people' do
      get :index
      expect(assigns(:people).count).to eq 3
      expect(response).to render_template 'index'
    end
  end
end