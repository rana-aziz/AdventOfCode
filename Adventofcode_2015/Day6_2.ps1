#Day3 - Part two

$Day6_Input = (Get-Content -Path ".\Day6.txt")

$LightAction = "" #This will have the Light Action on or off or toggle
$LightsStatus = @{ } #Hashtable of tuples coordinates and their value on or off
$count = 0

foreach ($Inst in $Day6_Input) {
     if ($Inst -match '.*(off|on|toggle)\s(\d+).(\d+)\sthrough\s(\d+).(\d+)') { 
          $LightAction = $Matches.1
          #Start cooordinates
          $a = [int] $Matches.2
          $b = [int] $Matches.3
     
          #End Coordinates
          $x = [int] $Matches.4
          $y = [int] $Matches.5
     }
     else {
          Write-Host "Error in parsing $Inst"
     }

     $value = 0
     switch ($LightAction) {
          toggle { $value = 2 }
          on { $value = 1 }
          off { $value = -1 }
     }

     for ($i = $a; $i -le $x ; $i++) {
          for ($j = $b; $j -le $y ; $j++) {
               $Coor = [System.Tuple]::Create($i, $j)

               if ($LightsStatus.Contains($Coor)) {
                    if (!(($LightAction -eq "off") -and ($LightsStatus[$Coor] -eq 0))) {
                         $LightsStatus[$Coor] += $value
                    }
               }
               else {
                    if ($LightAction -eq "off") {
                         $LightsStatus.Add($Coor, 0)
                    } 
                    else {
                         $LightsStatus.Add($Coor, $value)
                    }        
               } 
          }
     }
     $count++
    Write-Progress -Activity "Turnning light on and off..." -status "Instruction $count of $($Day6_Input.count)" -PercentComplete (($count / $Day6_Input.count) * 100)
}

$TotalBrightness = ($LightsStatus.Values | Measure-Object -Sum).Sum
Write-Host "Total brightness is $TotalBrightness"

#answer 15343601