# Change Me
###################################

# The file name to create from the byte chunk files
$OutputFile = "./tst.ps1"

# The path to the in folder where the byte chunk files will be read
$InFolderPath = "./in"

# The file extension to the byte file chunks
$InFileExtension = ".txt"
###################################


If(!(test-path $InFolderPath))
{
      New-Item -ItemType Directory -Force -Path $InFolderPath
}

$InFileCount = [System.IO.Directory]::GetFiles("$InFolderPath", "$InFileExtension").Count

if($InFileCount -eq 0) 
{
    Write-Host There were no byte files found inside $InFolderPath
    exit
}

$chunks = New-Object System.Collections.ArrayList

for($i=0;$i -lt $InFileCount;$i++) {
    $fileName = $InFolderPath + $i.toString() + ".txt"
    $byteLines = [System.IO.File]::ReadAllLines($fileName)
    $chunks.AddRange($byteLines)
}

[System.IO.File]::WriteAllBytes($OutputFile, [byte[]]$chunks)