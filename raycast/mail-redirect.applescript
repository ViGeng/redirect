#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Foreground Mail Redirect Link
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📨
# @raycast.packageName Mail

# Documentation:
# @raycast.description Copies the foreground Mail deeplink and converts it to a redirect link
# @raycast.author ViGeng
# @raycast.authorURL https://raycast.com/vigeng

# Base URL for redirect service
set baseURL to "http://wgeng.site/redirect?url="

tell application "System Events"
	set frontmostApp to name of application processes whose frontmost is true
end tell

# Check if Mail is the frontmost application
if frontmostApp as string is equal to "Mail" then
	tell application "Mail"
		set _sel to get selection
		set _redirectLinks to {}
		
		repeat with _msg in _sel
			# Get the mail message URL
			set _messageURL to "message://%3c" & _msg's message id & "%3e"
			
			# URL encode the message URL using Python
			set _encodedURL to (do shell script "python3 -c \"import urllib.parse; print(urllib.parse.quote('" & _messageURL & "'))\"")
			
			# Construct the redirect URL
			set _redirectURL to baseURL & _encodedURL
			
			# Add to the list of redirect links
			set end of _redirectLinks to _redirectURL
		end repeat
		
		# Join multiple links with newlines and copy to clipboard
		set AppleScript's text item delimiters to return
		set the clipboard to (_redirectLinks as string)
		
		# Log success message
		if (count of _redirectLinks) = 1 then
			log "Copied mail redirect link to clipboard"
		else
			log "Copied " & (count of _redirectLinks) & " mail redirect links to clipboard"
		end if
	end tell
else
	log "Foreground app was " & frontmostApp & ", not Mail"
end if
