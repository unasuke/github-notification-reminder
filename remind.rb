require 'json'
require 'octokit'
require 'slack-ruby-client'

def in_business_time?
  localtime = Time.now.localtime('+09:00')
  return false if localtime.saturday? || localtime.sunday?
  return false if localtime.hour < 10 || localtime.hour > 19

  true
end

github_client = Octokit::Client.new(access_token: ENV['GITHUB_API_TOKEN'])
slack_client = Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])

notifications = github_client.notifications(participating: true)

return if notifications.empty?
return unless in_business_time?

attachments = notifications.map do |n|
  {
    color: '#36a64f',
    author_name: n.repository.full_name,
    author_link: n.repository.html_url,
    title: n.subject.title,
    title_link: n.subject.url.gsub('api.github.com/repos', 'github.com').gsub('/pulls/', '/pull/'),
    footer: n.repository.private ? ':lock:' : ':earth_asia:',
    ts: n.updated_at.to_i
  }
end

message = {
  text: 'Unread notifications',
  attachments: attachments
}

slack_client.chat_postMessage(
  channel: ENV['SLACK_CHANNEL'],
  as_user: true,
  **message
)
