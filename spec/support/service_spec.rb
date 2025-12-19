RSpec.configure do |config|
  config.before(:each, type: :service) do
    # Stub mailers/jobs for pure service tests
    allow_any_instance_of(ActionMailer::Base).to receive(:deliver_later)
    allow_any_instance_of(ApplicationJob).to receive(:perform_later)
  end
end
