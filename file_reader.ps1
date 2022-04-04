# Change Me
###################################
$InputFile = "./bytes.txt"
$OutputFile = "./file_result.txt"
###################################

$SourceLines = [System.IO.File]::ReadAllLines($InputFile)
$ByteArray = New-Object Byte[] $SourceLines.Length
for($i=0;$i -lt $SourceLines.Length;$i++) {
    $ByteArray[$i] = [int]$SourceLines[$i]
}
[System.IO.File]::WriteAllBytes($OutputFile, $ByteArray)
