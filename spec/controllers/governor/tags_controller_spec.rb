require 'spec_helper'

module Governor
  describe TagsController do
    include Devise::TestHelpers
    include ERB::Util
    render_views
    before do
      @article = Factory(:article, :author => Factory(:user))
      @tag = Factory(:tag, :resources => [@article])
    end
    
    context "#show" do
      it "shows all articles for that tag" do
        get :show, :id => @tag.id, :governor_mapping => :articles
        assigns[:articles].should == [@article]
        response.body.should include html_escape('Showing articles tagged as "misconduct".')
      end
    end
  end
end