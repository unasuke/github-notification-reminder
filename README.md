# GitHub notification reminder
![https://flat.badgen.net/github/license/unasuke/github-notification-reminder](https://flat.badgen.net/github/license/unasuke/github-notification-reminder)

## What
![Screenshot](https://user-images.githubusercontent.com/4487291/54877481-c4618e00-4e62-11e9-8a74-a2542a193bff.png)

Post participating notifications to your slack channel as bot user.

## How to use

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/unasuke/github-notification-reminder)

### Generate Slack bot user token
![Slack bot token](https://user-images.githubusercontent.com/4487291/54877492-e529e380-4e62-11e9-9c3a-5ca21174f324.png)

### Generate GitHub personal access tokens
Visit here <https://github.com/settings/tokens>

![permissions of the GitHub personal access token](https://user-images.githubusercontent.com/4487291/54877473-bb70bc80-4e62-11e9-95c3-6abdff7d4453.png)

### Set environment vars
- `SLACK_API_TOKEN`
- `GITHUB_API_TOKEN`
- `SLACK_CHANNEL`

See `.env.sample` also.

### Invoke `remind.rb`
That's all!
