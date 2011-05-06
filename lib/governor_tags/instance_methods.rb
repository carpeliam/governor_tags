module GovernorTags
  module InstanceMethods
    def tag_list
      self.tags.map{|t| t.name }.join(GovernorTags.delimiter)
    end
    def tag_list=(tag_names)
      self.tags = tag_names.split(GovernorTags.delimiter).map{|t| Tag.find_or_create_by_name(t.strip) }
    end
  end
end