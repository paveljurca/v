WScript.Echo ""
WScript.Echo "VODCAST <https://github.com/paveljurca/vodcast>, 2017"
WScript.Echo ""
WScript.Echo "(i) Vyberte korenovou slozku rozbalene Mediasite prezentace"
WScript.Echo "(i) Choose the root folder of the unzipped Mediasite publish-to-go package"
WScript.Echo ""

Set shell = CreateObject("Shell.Application")
Set mediasite = shell.BrowseForFolder(0, "Vyberte korenovou slozku rozbalene Mediasite prezentace / Choose the root folder of the unzipped Mediasite publish-to-go package", 0, "%USERPROFILE%")
Set objShell = WScript.CreateObject("WScript.Shell")

'start the programm

'__DEBUG__
vodcast = objShell.Run("perl.exe " & "lib\vodcast.pl " & """" & mediasite.self.Path & """", 3, true)


'open destination folder when finished
if vodcast = 0 then
return = objShell.Run("explorer.exe " & mediasite.self.Path & "\VODCAST", 3, false)
end if
