#Day4 - Part two

$stopwatch = [system.diagnostics.stopwatch]::StartNew()
$i = 282749
$puzzle = "yzbqklnj"

do {
     $someString = $puzzle + $i
     $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
     $utf8 = New-Object -TypeName System.Text.UTF8Encoding
     $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString)))
     $i++
     if ($i % 500000 -eq 0) {
          Write-Host  "Decimal value has reached $i"
          $stopwatch.Elapsed
     }
}until ($hash.StartsWith("00-00-00"))

Write-Host ("Hash is {0} and the minimum decimal value is {1}" -f $hash, (--$i))

$stopwatch.Stop()
$stopwatch.Elapsed

#answer is 9962624