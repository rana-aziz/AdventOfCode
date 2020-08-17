#Day2 - Part two

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
   $Min1=0
   $Min2=0
   if ($gift.L -le $gift.W){
      $Min1=$gift.L
      if ($gift.W -le $gift.H){
         $Min2=$gift.W
      }
      else {
            $Min2=$gift.H
      }
      
   }
   elseif($gift.W -le $gift.L){
      $Min1=$gift.W
      if ($gift.L -le $gift.H){
         $Min2=$gift.L
      }
      else {
            $Min2=$gift.H
      }
     
      
   }
   $Ribbon_Rap=$Min1+$Min1+$Min2+$Min2
   $Ribbon_Bow= $gift.L * $gift.W * $gift.H
   $gift_wrap_needed = $Ribbon_Rap + $Ribbon_Bow
   $All_wrap_needed += $gift_wrap_needed
}
Write-Host "All wrap needed=$All_wrap_needed"


#The answer is : 3842356

