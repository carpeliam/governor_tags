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
    
    context "#query" do
      it "responds with a list of tags beginning with the input" do
        get :query, :query => 'misc', :governor_mapping => :articles, :format => :json
        response.body.should == ['misconduct'].to_json
      end
      
      it "responds with an empty array if there are no matches" do
        get :query, :query => 'not a match', :governor_mapping => :articles, :format => :json
        response.body.should == [].to_json
      end
    end
  end
end