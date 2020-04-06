Set-Alias inkscape "C:\Program Files\Inkscape\inkscape.exe"

function ExportArea($x0, $y0, $x1, $y1, $outFile) {
}

function ExportImage ($name, $width, $height) {
    Write-Host """$($name).png"""
    Start-Process "C:\Program Files\Inkscape\inkscape.exe" -Wait -ArgumentList ( `
        "-f", """$($name).svg""", `
        "-e", """$($name).png"""
        )
    inkscape -f "$($name).svg" -e "$($name).png"
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
            #inkscape -f "$($name).svg" -e "$($name)-$($x)-$($y).png" --export-area="$($x0):$($y0):$($x1):$($y1)"
        }
    }
}



#
#inkscape -f forbidden.svg -e forbidden-1.png --export-area=0:0:32:32
ExportArea 0 0 64 32 "forbidden.png"
ExportArea 0 0 32 32 "forbidden-1.png"
ExportArea 32 0 64 32 "forbidden-2.png"



ExportImage "forbidden" 2 1
ExportImage "test" 2 2
