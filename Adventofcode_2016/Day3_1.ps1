#Day3 - Part one

$Day3 = Get-Content -Path ".\Day3.txt"

$triangleCounter = 0
foreach ($triangle in $Day3) {
     if ($triangle -match '\s+(\d+)\s+(\d+)\s+(\d+)') {
          $edges = @([int]$Matches[1],[int]$Matches[2],[int]$Matches[3] ) |Sort-Object -Descending
          if (($edges[1]+$edges[2]) -gt $edges[0]){
               $triangleCounter ++
          }
     }
}

write-host "Number of possoible triangles is: $triangleCounter"

#answer 1050

