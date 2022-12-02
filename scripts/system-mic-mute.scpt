#!/usr/bin/env osascript

set inputVolume to input volume of (get volume settings)
if inputVolume = 0 then
    set inputVolume to 100
    set displayNotification to "Unmuted"
else
    set inputVolume to 0
    set displayNotification to "Muted"
end if

set volume input volume inputVolume
display notification displayNotification with title "Microphone"
