require 'spec_helper'

module Refinery
  describe FastController, :type => :controller do
    it "should render the wymiframe template" do
      get :wymiframe

      expect(response).to be_success
      expect(response).to render_template(:wymiframe)
    end
  end
end
