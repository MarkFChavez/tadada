require 'spec_helper'

describe Category do
  it { should have_many(:discussion_categories).dependent(:destroy) }
  it { should have_many(:discussions).through(:discussion_categories) }
end
