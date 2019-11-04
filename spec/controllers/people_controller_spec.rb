require 'rails_helper'

describe PeopleController, :type => :controller do 
  render_views
  before do
    @file = fixture_file_upload(Rails.root.join('spec', 'test.csv'), 'text/csv')
  end
  describe '#import' do
    it 'should redirect to root when no params is passed' do
      post :import
      expect(flash[:alert]).to eq "Please include a valid csv file"
      expect(response).to redirect_to root_path
    end

    it 'should update people count' do
      expect{
        post :import, params: {person: {:file => @file}}
      }.to change(Person, :count).by(1)
      expect(flash[:notice]).to eq "Success"
      expect(response).to redirect_to root_path
    end
  end
end