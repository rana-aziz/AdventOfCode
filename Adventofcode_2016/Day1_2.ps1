#Day1 - Part two
<#
Function Definition:
1. It adds values and keys to a Hashtable
2. If the Hashtable contains the value, it writes a message in the console and exit the script
#>
function Add-HashtableValues {
     param(
          [Parameter(Mandatory = $true)] [hashtable] $TableName,
          [Parameter(Mandatory = $true)] [System.Object] $Key,
          [Parameter(Mandatory = $false)] [string] $Value,
          [Parameter(Mandatory = $true)] [string] $Message
     )

     if ($TableName.Contains($Key)) {
          Write-Host  $Message
          exit $code
     }
     else {
          if ($Value) {
               $TableName.Add($Key, $Value)
          }
          else {
               $TableName.Add($Key, $true)
          }
     }
}

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

$InstDone = @{}

foreach ($Inst in $Instructions) {
     if ($Inst -match '(.)(\d+)') {
          $Dir = $Matches.1
          $Block = [int]$Matches.2
     }
     else {
          Write-Host "Error in parsing $Inst"
     }
     $PreviousCoor = [PSCustomObject]@{
          CardinalDir = $Coordinates.CardinalDir
          x           = $Coordinates.x
          y           = $Coordinates.y
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
     
     if ($PreviousCoor.x -ne $Coordinates.x) {
          if ($PreviousCoor.x -lt $Coordinates.x) { 
               for ($i = $PreviousCoor.x; $i -lt $Coordinates.x; $i++) {
                    $WalkOnCoor = [System.Tuple]::Create($i, $Coordinates.y)
                    Add-Hashtablevalues -TableName $InstDone -Key $WalkOnCoor -Message "First Coordinate to visit twice is $WalkOnCoor"
               }
          }
          elseif ($PreviousCoor.x -gt $Coordinates.x) {
               for ($i = $PreviousCoor.x; $i -gt $Coordinates.x; $i--) {
                    $WalkOnCoor = [System.Tuple]::Create($i, $Coordinates.y)
                    Add-Hashtablevalues -TableName $InstDone -Key $WalkOnCoor -Message "First Coordinate to visit twice is $WalkOnCoor"
               }
          }
          
     }
     elseif ($PreviousCoor.y -ne $Coordinates.y) {
          if ($PreviousCoor.y -lt $Coordinates.y) { 
               for ($i = $PreviousCoor.y; $i -lt $Coordinates.y; $i++) {
                    $WalkOnCoor = [System.Tuple]::Create($Coordinates.x, $i)
                    Add-Hashtablevalues -TableName $InstDone -Key $WalkOnCoor -Message "First Coordinate to visit twice is $WalkOnCoor"
               }
          }
          elseif ($PreviousCoor.y -gt $Coordinates.y) {
               for ($i = $PreviousCoor.y; $i -gt $Coordinates.y; $i--) {
                    $WalkOnCoor = [System.Tuple]::Create($Coordinates.x, $i)
                    Add-Hashtablevalues -TableName $InstDone -Key $WalkOnCoor -Message "First Coordinate to visit twice is $WalkOnCoor"
               }
          }
          
     }
}



#answer 111
