'set up a file dialog
Set shell = CreateObject("Shell.Application")
Set mediasite = shell.BrowseForFolder(0, "Pick up your Mediasite presentation folder", 0, "%USERPROFILE%")
'return full path for the selected folder
WScript.Echo """" & mediasite.self.Path & """"
