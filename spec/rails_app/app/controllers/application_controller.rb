class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_tags
  private
  def get_tags
    @all_tags = Tag.all
  end
end
