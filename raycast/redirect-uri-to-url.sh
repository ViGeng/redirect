#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Redirect Clipboard URI to URL
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔗
# @raycast.packageName Utils

# Documentation:
# @raycast.description Get clipboard content, check if it's a URI, convert to redirect URL and copy back to clipboard
# @raycast.author rowan
# @raycast.authorURL https://raycast.com/vigeng

# Constant base URL
BASE_URL="https://vigeng.github.io/redirect?url="
BASE_URL="http://wgeng.site/redirect?url="

# Get clipboard content
CLIPBOARD_CONTENT=$(pbpaste)

# Check if clipboard is empty
if [ -z "$CLIPBOARD_CONTENT" ]; then
  echo "Clipboard is empty"
  exit 1
fi

# Check if the clipboard content looks like a URI (contains :// or starts with common schemes)
if [[ "$CLIPBOARD_CONTENT" =~ ^[a-zA-Z][a-zA-Z0-9+.-]*:// ]] || [[ "$CLIPBOARD_CONTENT" =~ ^(mailto:|tel:|sms:|message://) ]]; then
  # Local URI to encode
  LOCAL_URI="$CLIPBOARD_CONTENT"
  
  # Encode the URI using Python's urllib.parse.quote
  ENCODED_URI=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$LOCAL_URI'''))")
  
  # Construct the full URL
  FULL_URL="${BASE_URL}${ENCODED_URI}"
  
  # Copy the redirect URL back to clipboard
  echo "$FULL_URL" | pbcopy
  
  echo "✅ Converted URI to redirect URL and copied to clipboard"
  echo "Original: $LOCAL_URI"
  echo "Redirect: $FULL_URL"
else
  echo "❌ Clipboard content doesn't appear to be a URI"
  echo "Content: $CLIPBOARD_CONTENT"
  exit 1
fi