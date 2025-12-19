require 'rails_helper'

RSpec.describe PostPublishingService, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }

  describe 'published scope' do
    let(:published_post) { create(:post, published: true ) }
    it 'returns published posts' do
      expect(described_class.published).to include(published_post)
    end
  end
end
