#Day2 - Part two

$Day2 = Get-Content -Path ".\Day2.txt"

$CoordinateHashtable = @{
     "(0, 2)"   = '1'
     "(-1, 1)"  = '2'
     "(0, 1)"   = '3'
     "(1, 1)"   = '4'
     "(-2, 0)"  = '5'
     "(-1, 0)"  = '6'
     "(0, 0)"   = '7'
     "(1, 0)"   = '8'
     "(2, 0)"   = '9'
     "(-1, -1)" = 'A' 
     "(0, -1)"  = 'B'
     "(1, -1)"  = 'C'
     "(0, -2)"  = 'D'    
}
$UpTable = @{
     "(-2, 0)" = '5'
     "(-1, 1)" = '2'
     "(0, 2)"  = '1'
     "(1, 1)"  = '4'
     "(2, 0)"  = '9'

}
$DownTable = @{
     "(-2, 0)"  = '5'
     "(-1, -1)" = 'A'
     "(0, -2)"  = 'D'
     "(1, -1)"  = 'C'
     "(2, 0)"   = '9'
}
$RightTable =@{
     "(0, 2)"   = '1'
     "(1, 1)"   = '4'
     "(2, 0)"   = '9'
     "(1, -1)"  = 'C'
     "(0, -2)"  = 'D' 
}
$LeftTable =@{
     "(0, 2)"   = '1'
     "(-1, 1)"  = '2'
     "(-2, 0)"  = '5'
     "(-1, -1)" = 'A'
     "(0, -2)"  = 'D'
}

$x = -2
$y = 0
     
foreach ($instruction in $Day2) {
     $instructionChar = $instruction.ToCharArray()
    
     foreach ($char in $instructionChar) {
          switch ($char) {
               U { 
                    if (-not($UpTable.ContainsKey("($x, $y)"))) {
                         $y += 1 
                    }
               }
               D {
                    if (-not($DownTable.ContainsKey("($x, $y)"))) {
                         $y -= 1 
                    }
               }
               L {
                    if (-not($LeftTable.ContainsKey("($x, $y)"))) {
                         $x -= 1 
                    }
               }
               R {
                    if (-not($RightTable.ContainsKey("($x, $y)"))) {
                         $x += 1 
                    }
               }
          }    
     }
     $CoordinateHashtable["($x, $y)"]
}

#answer 57DD8



