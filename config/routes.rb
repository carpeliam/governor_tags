Rails.application.routes.draw do
  Governor.resources.keys.each do |resource|
    resources :tags, :module => 'governor', :governor_mapping => resource, :only => :show
  end
end