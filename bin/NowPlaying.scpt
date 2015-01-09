tell application "System Events"
	set apps to (name of every process)
end tell

set currentTrack to null

if apps contains "iTunes" then
	tell application "iTunes"
		if player state is not stopped then
			set currentTrack to current track
			
			set trackname to name of currentTrack
			set artistname to artist of currentTrack
			set albumname to album of currentTrack
			set state to player state
			
			set output to artistname & ": " & albumname & " > " & trackname & " (" & state & " in iTunes)"
		end if
	end tell
end if

if currentTrack = null then
	if apps contains "Spotify" then
		tell application "Spotify"
			if player state is not stopped then
				set trackname to name of current track
				set artistname to artist of current track
				set albumname to album of current track
				set state to player state
				
				set output to artistname & ": " & albumname & " > " & trackname & " (" & state & " in Spotify)"
			end if
		end tell
	end if
end if

output

