( *< Byte Byte Byte

# Description
This includes two small PowerShell scripts that enable the serializing and subsequent deserializing of any file. This allows that file, for example like a .exe or a .zip, to be sent over the internet as regular text and then reassembled at the destination using the other script.

# Instructions
1. Choose any file
3. Copy the out.ps1 script file to that directory. Change the $InputFile variable to the name of the file.
4. Run out.ps1
5. Send all of the byte chunks files located in the output folder file anywhere you want and place the file in any directory.
6. Either manually type or copy the in.ps1 script to the same location as the file from step #5. 
7. Open in.ps1 and edit the $OutputFile variable to be the deserialized output file name of your choice.
8. Run in.ps1
9. The original file that was serialized should now be usable.
