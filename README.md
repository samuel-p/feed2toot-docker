# [feed2toot-docker](https://git.sp-codes.de/samuel-p/feed2toot-docker)

[![Build Status](https://ci.sp-codes.de/api/badges/samuel-p/feed2toot-docker/status.svg)](https://ci.sp-codes.de/samuel-p/feed2toot-docker) [![License](https://img.shields.io/badge/license-GPL--3.0-orange)](#license) [![Docker Pulls](https://img.shields.io/docker/pulls/samuelph/feed2toot)](https://hub.docker.com/r/samuelph/feed2toot)

A Docker image for [feed2toot](https://gitlab.com/chaica/feed2toot).

## Usage

Create a `feed2toot` directory and your custom `feed2toot.ini` with the [feed2toot config](https://gitlab.com/chaica/feed2toot#use-feed2toot) in this directory. You can use the path `/feed2toot` in that file, as the directory will be mounted to that path.

Example:

```ini
[mastodon]
instance_url=<mastodon-url>
; Here you need the two files created by register_feed2toot_app
user_credentials=/feed2toot/feed2toot_usercred.txt
client_credentials=/feed2toot/feed2toot_clientcred.txt
; Default visibility is public, but you can override it:
; toot_visibility=unlisted

[cache]
cachefile=/feed2toot/feed2toot.db
cache_limit=10000

[lock]
lock_file=/feed2toot/feed2toot.lock
lock_timeout=300

[rss]
uri=<rss-url>
; uri_list=/feed2toot/rsslist.txt
toot={title} {summary:400}

[hashtaglist]
; several_words_hashtags_list=/feed2toot/hashtags.txt

[feedparser]
accept_bozo_exceptions=true

[media]
; custom=/feed2toot/media/logo.png
```

To [create the authorization for feed2toot](https://gitlab.com/chaica/feed2toot#create-the-authorization-for-the-feed2toot-app) you can also use this image:

```bash
docker run --rm -it -v /your/path/feed2toot:/feed2toot samuelph/feed2toot register_feed2toot_app
```

Finally copy the [`cron`](cron) file in the `feed2toot` directory and run the docker image:

```bash
docker run -d -v /your/path/feed2toot:/feed2toot samuelph/feed2toot
```

Optionally you can adjust the cron job to fit your needs by editing the `cron` file. Per default the cron job runs every minute.

To run the image with Docker Compose you can just use this:

```yaml
services:
  feed2toot:
    image: samuelph/feed2toot
    restart: always
    volumes:
      - /your/path/feed2toot:/feed2toot
```

## Usage with multiple feeds

You can also use a single container to handle multiple feeds. Therefore you should create a folder for each feed in the `feed2toot` folder from above. Don't forget to update the paths in the `*.ini` files. Finally you can add a cronjob for each feed in the `cron` file:

```
*/3 * * * * /usr/local/bin/feed2toot -c /feed2toot/feed1/feed2toot.ini > /proc/1/fd/1 2>/proc/1/fd/2
*/7 * * * * /usr/local/bin/feed2toot -c /feed2toot/feed2/feed2toot.ini > /proc/1/fd/1 2>/proc/1/fd/2
```

Now you can run the image like before.

## License

[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0)

feed2toot-docker is Free Software: It is licensed under GNU GPL v3 (See [LICENSE](LICENSE) for more information).
