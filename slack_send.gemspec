Gem::Specification.new do |s|
  s.name = %q{slack_send}
  s.version = "0.0.1"
  s.date = %q{2020-06-02}
  s.authors = "Liz"
  s.summary = %q{sends messages to slack}
  s.files = [
    "lib/slack_send.rb",
    "lib/slack_send/configuration.rb",
    "lib/slack_send/reply.rb",
    "lib/slack_send/send.rb"
  ]
  s.require_paths = ["lib"]
  s.add_dependency 'httparty'
  s.add_development_dependency "rspec"
end
