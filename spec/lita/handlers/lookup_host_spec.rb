require "spec_helper"

describe Lita::Handlers::LookupHost, lita_handler: true do
  it { is_expected.to route_command("lookup host localhost").to(:resolve) }
  it { is_expected.to route_command("lookup host 127.0.0.1").to(:resolve) }

  it "performs a forward lookup on localhost" do
    send_command("lookup host localhost")
    expect(replies.last.split(/\n/).last).to eq("127.0.0.1")
  end

  it "performs a reverse lookup on 127.0.0.1" do
    send_command("lookup host 127.0.0.1")
    expect(replies.last).to eq("localhost")
  end
end
