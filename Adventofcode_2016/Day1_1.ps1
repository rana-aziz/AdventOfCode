#Day6 - Part one

$Day1 = Get-Content -Path ".\Day1.txt"
$Instructions = (($Day1.replace(' ' , '')).Split(", "))

$CardinalDir = [PSCustomObject]@{
     N = "North"
     S = "South"
     E = "East"
     W = "West"
}

$Coordinates = [PSCustomObject]@{
     CardinalDir = "North"
     x           = 0
     y           = 0
}

foreach($Inst in $Instructions){
     if ($Inst -match '(.)(\d+)'){
          $Dir = $Matches.1
          $Block= [int]$Matches.2
     }
     switch (($Dir)) {
          R { 
               if ($Coordinates.CardinalDir -eq $CardinalDir.N) {
                    $Coordinates.CardinalDir = $CardinalDir.E
                    $Coordinates.x += $Block
               }
               elseif ($Coordinates.CardinalDir -eq $CardinalDir.S) {
                    $Coordinates.CardinalDir = $CardinalDir.W
                    $Coordinates.x -= $Block
               }
               elseif ($Coordinates.CardinalDir -eq $CardinalDir.E) {
                    $Coordinates.CardinalDir = $CardinalDir.S
                    $Coordinates.y -= $Block
               }
               elseif ($Coordinates.CardinalDir -eq $CardinalDir.W) {
                    $Coordinates.CardinalDir = $CardinalDir.N
                    $Coordinates.y += $Block
               }         
          }
          L { 
               if ($Coordinates.CardinalDir -eq $CardinalDir.N) {
                    $Coordinates.CardinalDir = $CardinalDir.W
                    $Coordinates.x -= $Block
               }
               elseif ($Coordinates.CardinalDir -eq $CardinalDir.S) {
                    $Coordinates.CardinalDir = $CardinalDir.E
                    $Coordinates.x += $Block
               }
               elseif ($Coordinates.CardinalDir -eq $CardinalDir.E) {
                    $Coordinates.CardinalDir = $CardinalDir.N
                    $Coordinates.y += $Block
               }
               elseif ($Coordinates.CardinalDir -eq $CardinalDir.W) {
                    $Coordinates.CardinalDir = $CardinalDir.S
                    $Coordinates.y -= $Block
               }   
          }
     }
}

$Coordinates

#answer 288