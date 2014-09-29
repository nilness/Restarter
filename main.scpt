--set input to text returned of (display dialog "Enter length of timer" default answer "" )
tell me
	activate
end tell
set input to 300
set increment to 5
set countdown to input

repeat input / increment times
	set min to countdown div 60
	set sec to countdown mod 60
	if sec < 10 then set sec to "0" & sec as string
	display dialog "Restart script running. This MUST be removed before returning computer to customer! Time left: " & min & ":" & sec buttons {"Cancel", "Restart Now"} giving up after increment
	set user_command to the button returned of result
	if user_command is "Cancel" then
		quit
	end if
	if user_command is "Restart Now" then
		exit repeat
	end if
	set countdown to countdown - increment
end repeat

tell application "Finder"
	restart
end tell
