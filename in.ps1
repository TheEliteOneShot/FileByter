# Change Me
###################################

# The file name to create from the byte chunk files
$OutputFile = "./tst.ps1"
###################################

$filepath = "./in/"
$filetype = "*.txt"
$file_count = [System.IO.Directory]::GetFiles("$filepath", "$filetype").Count

$chunks = New-Object System.Collections.ArrayList

for($i=0;$i -lt $file_count;$i++) {
    $fileName = $filepath + $i.toString() + ".txt"
    $byteLines = [System.IO.File]::ReadAllLines($fileName)
    $chunks.AddRange($byteLines)
}

[System.IO.File]::WriteAllBytes($OutputFile, [byte[]]$chunks)