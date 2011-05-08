module Governor
  class TagsController < ApplicationController
    include Governor::Controllers::Helpers
    
    helper :governor
    helper Governor::Controllers::Helpers
    
    def show
      @tag = Tag.find(params[:id], :include => :resources)
      set_resources @tag.resources
      flash[:notice] = t('governor_tags.tags_for', :resource_type => params[:governor_mapping], :tag => @tag.name)
      render :template => 'governor/articles/index'
    end
  end
end