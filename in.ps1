# Change Me
###################################

# The file name to create from the byte chunk files
$OutputFile = "./tst.zip"

# The path to the in folder where the byte chunk files will be read
$InFolderPath = "./in/"

# The file extension to the byte file chunks
$InFileExtension = ".txt"
###################################


If(!(test-path $InFolderPath))
{
      New-Item -ItemType Directory -Force -Path $InFolderPath
}

$result = [System.IO.Directory]::GetFiles($InFolderPath, $InFileExtension)

Write-Host $result

$InFileCount = [System.IO.Directory]::GetFiles($InFolderPath).Count

if($InFileCount -eq 0) 
{
    Write-Host There were no byte files found inside $InFolderPath
    exit
}

try { 
    $ostream = [System.Io.File]::OpenWrite($OutputFile)
    for($i=0;$i -lt $InFileCount;$i++) {
        $fileName = $InFolderPath + $i.toString() + ".txt"
        $byteLines = [byte[]][System.IO.File]::ReadAllLines($fileName)
        $ostream.Write($byteLines, 0, $byteLines.Count)
    }
}
finally { $ostream.close(); }


