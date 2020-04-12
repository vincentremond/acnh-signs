param ($name, $width, $height)

Write-Host """$($name).png"""
Start-Process "C:\Program Files\Inkscape\inkscape.exe" -Wait -ArgumentList ( `
    "-f", """$($name).svg""", `
    "-e", """$($name).png"""
    )
for ($x = 0; $x -lt $width; $x++) {
    for ($y = 0; $y -lt $height; $y++) {
        $x0 = ($x + 0) * 32
        $x1 = ($x + 1) * 32
        $y0 = ($y + 0) * 32
        $y1 = ($y + 1) * 32
        $ef = "$($name)-$($height - $y)-$($x + 1).png"
        Write-Host "$ef"
        Start-Process "C:\Program Files\Inkscape\inkscape.exe" -Wait -ArgumentList ( `
            "-f", """$($name).svg""", `
            "-e", """$($ef)""", `
            "--export-area=""$($x0):$($y0):$($x1):$($y1)""" `
            )
    }
}
