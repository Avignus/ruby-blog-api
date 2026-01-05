

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
  it { should have_db_column(:published).of_type(:integer) }

  describe 'published enum' do
    it { should define_enum_for(:published) }
  end
end
