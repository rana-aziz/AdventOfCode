#Day3 - Part two

$Day3 = Get-Content -Path ".\Day3.txt"

$Row1 = @()
$Row2 = @()
$Row3 = @()

$triangleCounter = 0
foreach ($triangle in $Day3) {
     if ($triangle -match '\s+(\d+)\s+(\d+)\s+(\d+)') {
          $Row1 += [int]$Matches[1]
          $Row2 += [int]$Matches[2]
          $Row3 += [int]$Matches[3]
     }
}

$AllRows = @($Row1, $Row2, $Row3)

foreach ($Row in $AllRows) {
     $edgesCounter = 0
     $triangle = [PSCustomObject]@{
          E1 = 0
          E2 = 0
          E3 = 0
     }
     foreach ($edge in $Row) {
          $edgesCounter++
          
          if ($edgesCounter -eq 1) {
               $triangle.E1 = $edge 
          }

          if ($edgesCounter -eq 2) {
               $triangle.E2 = $edge  
          }  

          if ($edgesCounter -eq 3) {
               $triangle.E3 = $edge 
               $edges = @([int]$triangle.E1,[int]$triangle.E2,[int]$triangle.E3 ) |Sort-Object -Descending
               if (($edges[1]+$edges[2]) -gt $edges[0]){
                    $triangleCounter ++
               }           
               $triangle.E1 = 0
               $triangle.E2 = 0
               $triangle.E3 = 0
               $edgesCounter = 0 
          }        
     }
}

write-host "Number of possible triangles is: $triangleCounter"

#answer 1921

