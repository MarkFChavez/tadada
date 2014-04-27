require 'spec_helper'

describe DiscussionCategory do
  it { should belong_to :discussion }
  it { should belong_to :category }
end
