require 'rails_helper'

RSpec.describe PostPublishingService, type: :service do
  let(:user) { create(:user) }
  let(:post) { build(:post, user: user, published: false ) }

  it 'publishes post' do
    expect { described_class.new(post).call }.to change { post.reload.published }.from(false).to(true)
  end
end
