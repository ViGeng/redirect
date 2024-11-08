#!/bin/bash

# Constant base URL
BASE_URL="https://vigeng.github.io/redirect?url="
BASE_URL="http://wgeng.site/redirect?url="

# Check if the URI is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <local_uri>"
  exit 1
fi

# Local URI to encode
LOCAL_URI="$1"

# Encode the URI using Python's urllib.parse.quote
ENCODED_URI=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$LOCAL_URI'''))")

# Construct the full URL
FULL_URL="${BASE_URL}${ENCODED_URI}"

# return the full URL
echo $FULL_URL