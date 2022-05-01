# Change Me
#############################

# The file to serialize into byte chunk files
$InputFile = "./out.ps1"

# The size of the byte chunks that should be outputted
$ChunkSizeInMegabytes = 1

# Out folder location
$outFolderLocation = "./out/"

# Output Byte File Extension
$outFileExtension = ".txt"

# Clear the output folder before writing the byte chunk files
$ClearOutFolder = 1


#############################

$byteLines = [string[]][System.IO.File]::ReadAllBytes($InputFile)

$MB_SIZE = (1024 * 1024)

if ($byteLines -lt $MB_SIZE) {
    Write-Host Input file size is $byteLines.Length bytes and is smaller than $MB_SIZE bytes so it will not be chunked.
    [IO.File]::WriteAllLines($outFolderLocation + "0" + $outFileExtension, $byteLines)
    exit
}

$chunkSizeMegaByte = $MB_SIZE * $ChunkSizeInMegabytes

$totalChunks = [Math]::Ceiling($byteLines.Length / $chunkSizeMegaByte)

Write-Host Now generating $totalChunks chunks that are $ChunkSizeInMegabytes mb in size

if ($ClearOutFolder) { Remove-Item $outFolderLocation* -Force }

for($i=0;$i -lt $totalChunks;$i++) {
    $startChunk = 0
    $endChunk = 0

    if ($i -eq 0) 
    {
        Write-Host Start
        $startChunk = 0
        $endChunk = $chunkSizeMegaByte
    }
    elseif ($i -ge 1 -and $i -lt ($totalChunks-1)) 
    {
        Write-Host Middle ($i-1)
        $startChunk = $chunkSizeMegaByte*$i
        $endChunk = $chunkSizeMegaByte*($i+1)
    }
    elseif ($i -eq ($totalChunks-1))
    {
        Write-Host End Chunk
        $startChunk = $chunkSizeMegaByte*$i
        $endChunk = $byteLines.Length
    }
    Write-Host Start Chunk: [ $startChunk bytes] - End Chunk: [ $endChunk bytes]
    [IO.File]::WriteAllLines($outFolderLocation + $i.toString() + $outFileExtension, $byteLines[$startChunk..$endChunk])
}