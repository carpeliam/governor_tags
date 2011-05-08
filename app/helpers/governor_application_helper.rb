module GovernorApplicationHelper
  def tag_list(tags)
    content_tag :div, :class => 'tag_list' do
      concat 'Tag List'
      concat tag('br', nil, true)
      tags.each do |tag|
        concat(content_tag :div, :class => 'tag' do
          link_to tag.name, tag
        end)
      end
    end
  end
end