#Day2 - Part one

$Day2 = Get-Content -Path ".\Day2.txt"

$CoordinateHashtable = @{
     "(-1, 1)"  = 1
     "(0, 1)"   = 2
     "(1, 1)"   = 3
     "(-1, 0)"  = 4
     "(0, 0)"   = 5
     "(1, 0)"   = 6
     "(-1, -1)" = 7
     "(0, -1)"  = 8
     "(1, -1)"  = 9     
}

$x = 0
$y = 0
     
foreach ($instruction in $Day2) {
     $instructionChar = $instruction.ToCharArray()
    
     foreach ($char in $instructionChar) {
          switch ($char) {
               U { 
                    if (-not($y -eq '1')) {
                         $y += 1 
                    }
               }
               D {
                    if (-not($y -eq '-1')) {
                         $y -= 1 
                    }
               }
               L {
                    if (-not($x -eq '-1')) {
                         $x -= 1 
                    }
               }
               R {
                    if (-not($x -eq '1')) {
                         $x += 1 
                    }
               }
          }   
     }
     $CoordinateHashtable["($x, $y)"]
}





#answer 78985

