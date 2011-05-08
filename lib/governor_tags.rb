require 'governor_tags/rails'
require 'governor_tags/instance_methods'

tags = Governor::Plugin.new('tags')

tags.set_routes do
  collection do
    resources :tags, :only => :show, :module => :governor
  end
end
tags.register_model_callback do |base|
  base.send :include, GovernorTags::InstanceMethods
  base.has_and_belongs_to_many :tags
end

tags.register_partial :after_article_summary, 'articles/tags'
tags.register_partial :after_article_whole, 'articles/tags'
tags.register_partial :bottom_of_form, 'articles/tag_form'

Governor::PluginManager.register tags

module GovernorTags
  mattr_accessor :delimiter
  @@delimiter = ','
end