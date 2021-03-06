﻿#Day3 - Part one

$Day3 = (Get-Content -Path ".\Day3.txt").toCharArray()

#Set coordinates value with 0,0
$x = 0
$y = 0
$Coordinates = [System.Tuple]::Create($x, $y)

#Create empty Hashtable
$set = @{ }

#First coordinate/house gift
$set.Add($Coordinates, $true)

foreach ($char in $Day3) {
     if ($char -eq "^") {
          $y--
     }
     elseif ($char -eq "v") {
          $y++
     }
     elseif ($char -eq ">") {
          $x++
     }
     elseif ($char -eq "<") {
          $x--
     }
     else {
          Write-Host "I don't know this charachter $char"
     }

     $Coordinates = [System.Tuple]::Create($x, $y)
     if (! $set.Contains($Coordinates)) {
          $set.Add($Coordinates, $true)
     }

}

Write-Host "Total visited Houses are "$set.Count""


#---------------------------------------------#
<#
$counter = 0
foreach ($char in $Day3) {
     $counter++  
}
Write-Host "Total number of directions is $counter"

$set = @{}

$Coordinates = [System.Tuple]::Create(1,2)
$T2 = [System.Tuple]::Create(1,2)
$set.Add($T1, $true)
$set.Add($T2, $true)
#>
#---------------------------------------------#

#---------------------------------------------#
<#
    $OutputObj = [pscustomobject]@{
      x = $x
      y = $y
      }
    if (!$Directions.Contains($OutputObj.x -and $OutputObj.y -and $OutputObj.Value))
    {
    $Directions.Add($OutputObj) | Out-Null
    }
}

$Directions

#>
#---------------------------------------------#


<#
$length = ([int]$counter*2)
Write-Host "Array Length is $length"

$array = New-Object 'Object[,]' $length,$length

<# New-Object int[] 10000; $arr.length

$array[0][0]=1


$array = ,@()

#Create an array with rows and columns equal to nodes
$array = ,@(0..$length)
for ($i = 1; $i -lt $length; $i++){
     $array += ,@(0..$length)
     }


#Ensure all elements are set to 0
for($i = 0;$i -lt $length;$i++){
     for($j = 0;$j -lt $length;$j++){
          $array[$i][$j]=0
          }
     }
     
$x= [int]$counter
$y= [int]$counter
$array[$x][$y]=1
foreach ($char in $Day3)
{
    if ($char -eq "^") {
         $y--
      }
    elseif ($char -eq "v") {
         $y++
      }
    elseif ($char -eq ">") {
         $x++
      }
    elseif ($char -eq "<") {
         $x--
      }
    else{
    Write-Host "I don't know this charachter $char"
    }
$array[$x][$y]=1

}

$Houses=0
for($i = 0;$i -lt $length;$i++){
     for($j = 0;$j -lt $length ;$j++){
          if ($array[$i][$j]) {
         $Houses++
       
      }
          
          }
     }

Write-Host "Total visited Houses are $Houses"

#>