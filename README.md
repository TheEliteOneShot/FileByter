( *< Byte Byte Byte

# Description
This includes two small PowerShell scripts that enable the serializing and subsequent deserializing of any file. This allows that file, for example like a .exe or a .zip, to be sent over the internet as regular text and then reassembled on the other side using the other script.

# Instructions
1. Choose any file
2. Change the file name to a .txt extension (Example: change test.zip to test.txt)
3. Copy the file_writer.ps1 script file to that directory. Change the $InputFile variable to the name of the file from step #2.
4. Run file_writer.ps1
5. Send the bytes.txt file anywhere you want and place the file in any directory.
6. Either manually type or copy the file_reader.ps1 script to the same location as the file from step #5. 
7. Open file_reader.ps1 and edit the $OutputFile variable to be the original file name from step #1.
8. Run file_reader.ps1
9. Use the file that is created.
