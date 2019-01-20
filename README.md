# Debian image for Docker with SSH and some other plumbing

I wanted to do some stuff off of a simple image while kubing some netes and this is what came out.

This image has SSH, Git, [Rclone](https://rclone.org/), Curl, Wget, and Unzip installed.  The idea is that you can fire this image up, and set up an SSH tunnel, clone a git repo, or rclone to a cloud storage service in a Kubernetes sidecar.

Distributed under the BSD license. See ``LICENSE`` for more information.