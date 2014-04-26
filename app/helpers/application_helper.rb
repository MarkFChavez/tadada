module ApplicationHelper
  def count_for collection
    pluralize collection.count, collection.klass.to_s.downcase
  end
end
