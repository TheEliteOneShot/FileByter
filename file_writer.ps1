# Change Me
#############################
$InputFile = "./test.txt"
$OutputFile = "./bytes.txt"
#############################

$bytes = [System.IO.File]::ReadAllBytes($InputFile)
$byte_lines = New-Object System.Collections.ArrayList
for($i=0;$i -lt $bytes.Length;$i++) {
    $result = $byte_lines.Add($bytes[$i])
}
[IO.File]::WriteAllLines($OutputFile, $byte_lines)