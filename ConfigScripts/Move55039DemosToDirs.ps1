cd C:\LabFiles\Demos

$Chapters = 1..15 

foreach ( $Chap in $Chapters ) { 
    MKDir "Mod$Chap"
    Get-ChildItem "Demo $Chap.*" | Move-Item -Destination "Mod$Chap"
}
