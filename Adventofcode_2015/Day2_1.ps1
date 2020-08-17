#Day2 - Part one

$Day2_Input = (Get-Content -Path ".\Day2.txt")
#Create an empty array to contain all L, W & H for all the gift dimensions
$All_LWH = New-Object System.Collections.ArrayList

foreach ($Dim in $Day2_Input) {
   $count_X = 0
   $L = ""
   $W = ""
   $H = ""
   foreach ($char in $Dim.toCharArray()) {
      if ($char -eq "x") {
         $count_X++
      }
      else {
         if ($count_X -eq "0") { $L += $char }            
         if ($count_X -eq "1") { $W += $char }
         if ($count_X -eq "2") { $H += $char }
      }        
   }
   $OutputObj = [pscustomobject]@{
      L = [int]$L
      W = [int]$W
      H = [int]$H
   }
   $All_LWH.Add($OutputObj) | Out-Null
}



$All_wrap_needed=0
foreach ($gift in $All_LWH) {
   $gift_wrap_needed = 0
   $All_Slacks = @{ }
   $Area = (2 * $gift.L * $gift.W) + (2 * $gift.W * $gift.H) + (2 * $gift.H * $gift.L)
   $All_Slacks = ($gift.L * $gift.W), ($gift.W * $gift.H), ($gift.H * $gift.L)
   $Min_Slack = ($All_Slacks | measure -Min).Minimum

   $gift_wrap_needed = $Area + $Min_Slack
   $All_wrap_needed += $gift_wrap_needed
}
Write-Host "All wrap needed=$All_wrap_needed"


#The answer is : 1606483

