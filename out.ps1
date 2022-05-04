# Change Me
#############################

# The file to serialize into byte chunk files
$InputFile = "./quickstart.zip"

# The size of the input file chunk that will be converted to byte string files
# The string byte chunk output file size cannot exceed 65,536 bytes -- (number of elements) * (size of each element in bytes)
# The size of the output file chunks can be up to three times as much as the original file and are random 
# You will need to try different different numbers here to see if it meets the target output size threshold
$ChunkSizeInMegabytes = 40

# Out folder location
$outFolderPath = "./out/"

# Output Byte File Extension
$outFileExtension = ".txt"

# Clear the output folder before writing the byte chunk files (1 for True, 0 for False)
$ClearOutFolder = 1


#############################


$byteLines = [System.IO.File]::ReadAllBytes($InputFile)

If(!(test-path $outFolderPath))
{
      New-Item -ItemType Directory -Force -Path $outFolderPath
}


$MB_SIZE = (1024 * 1024)

if (($byteLines.Length / $MB_SIZE) -lt $ChunkSizeInMegabytes) {
    Write-Host Input file size is ($byteLines.Length / $MB_SIZE) megabytes and is smaller than $ChunkSizeInMegabytes megabytes so it will not be chunked.
    [IO.File]::WriteAllLines($outFolderPath + "0" + $outFileExtension, $byteLines)
    exit
}

$chunkSizeMegaByte = $MB_SIZE * $ChunkSizeInMegabytes

$totalChunks = [Math]::Ceiling($byteLines.Length / $chunkSizeMegaByte)

Write-Host Now generating $totalChunks chunks from a max size of $ChunkSizeInMegabytes mb chunks

if ($ClearOutFolder) { Remove-Item $outFolderPath* -Force }

for($i=0;$i -lt $totalChunks;$i++) {
    $startChunk = 0
    $endChunk = 0
    Write-Host Now writing ($i+1) out of $totalChunks total chunks
    if ($i -eq 0) 
    {
        $startChunk = 0
        $endChunk = $chunkSizeMegaByte
    }
    elseif ($i -ge 1 -and $i -lt ($totalChunks-1)) 
    {
        $startChunk = $chunkSizeMegaByte*$i+1
        $endChunk = $chunkSizeMegaByte*($i+1)
    }
    elseif ($i -eq ($totalChunks-1))
    {
        $startChunk = $chunkSizeMegaByte*$i+1
        $endChunk = $byteLines.Length
    }
    Write-Host Start Chunk: [ $startChunk bytes] - End Chunk: [ $endChunk bytes]
    [IO.File]::WriteAllLines($outFolderLocation + $i.toString() + $outFileExtension, [string[]]$byteLines[$startChunk..$endChunk])
}