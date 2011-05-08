class Tag < ActiveRecord::Base
  has_and_belongs_to_many :resources, :class_name => "<%= mapping.to.name %>"
  def to_param
    "#{id}-#{name.parameterize}"
  end
end