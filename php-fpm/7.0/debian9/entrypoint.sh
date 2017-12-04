#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "FPM USER ID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m fpm

exec "$@"
