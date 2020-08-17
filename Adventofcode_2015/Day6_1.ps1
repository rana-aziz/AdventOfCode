#Day6 - Part one

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

     for ($i = $a; $i -le $x ; $i++) {
          for ($j = $b; $j -le $y ; $j++) {
               $Coor = [System.Tuple]::Create($i, $j)
               if ($LightsStatus.Contains($Coor)) {
                    if ($LightAction -eq "toggle") {
                         if ($LightsStatus[$Coor] -eq "off") {
                              $LightsStatus[$Coor] = "on"
                         }
                         else {
                              $LightsStatus[$Coor] = "off"
                         }
                    }
                    else {
                         $LightsStatus[$Coor] = $LightAction
                    } 
               }
               else {
                    if ($LightAction -eq "toggle") {
                         $LightsStatus.Add($Coor, "on")
                    }
                    else {
                         $LightsStatus.Add($Coor, $LightAction)  
                    }    
               }
          }
     }
     $count++
     Write-Progress -Activity "Turnning light on and off..." -status "Instruction $count of $($Day6_Input.count)" -PercentComplete (($count / $Day6_Input.count) * 100)
}

$OnLights = $LightsStatus.Values | Where-Object { $_ -eq "on" }
Write-Host "Number of lights on $($OnLights.Count)"

#answer 400410