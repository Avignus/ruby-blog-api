

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }

  describe 'published enum' do
    it do
      should define_enum_for(:published).with_values(draft: 0, published: 1)
    end
  end
end
