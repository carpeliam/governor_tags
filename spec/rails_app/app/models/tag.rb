class Tag < ActiveRecord::Base
  has_and_belongs_to_many :resources, :class_name => "Article"
  def to_param
    "#{id}-#{name.parameterize}"
  end
end