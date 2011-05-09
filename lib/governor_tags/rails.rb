module GovernorTags
  class Engine < ::Rails::Engine
    config.to_prepare do
      ActionController::Base.helper(GovernorTagsApplicationHelper)
    end
  end
end