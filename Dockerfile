FROM rclone/rclone:1.67.0 AS rclone
FROM kopia/kopia:20240720.0.213037 AS kopia
FROM alpine:20240606 AS base

LABEL org.opencontainers.image.title "Hosting tools"
LABEL org.opencontainers.image.description "Hosting tools, rsync, restic, kopia, rclone, imagemagick, git, xz, ca-certificates, mariadb-client, wget, curl, openssh-client, rsync"
LABEL org.opencontainers.image.authors "githubcdr"
LABEL org.opencontainers.image.source "http://github.com/githubcdr/docker-hosting-tools"
LABEL org.opencontainers.image.licenses "MIT"
LABEL org.opencontainers.image.vendor "githubcdr"

RUN  apk add --update --no-cache libwebp-tools imagemagick git xz ca-certificates restic mariadb-client wget curl openssh-client rsync
COPY --from=rclone /usr/local/bin/rclone /usr/local/bin/rclone
COPY --from=kopia /bin/kopia /usr/local/bin/kopia
