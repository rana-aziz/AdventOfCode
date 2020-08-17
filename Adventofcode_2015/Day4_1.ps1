#Day4 - Part one

$stopwatch=[system.diagnostics.stopwatch]::StartNew()
$i=0
$puzzle="yzbqklnj"


do{
     $someString = $puzzle + $i
     $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
     $utf8 = New-Object -TypeName System.Text.UTF8Encoding
     $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString)))
     $i++
}until ($hash.StartsWith("00-00-0"))

Write-Host ("Hash is {0} and the minimum decimal value is {1}" -f $hash, (--$i))

$stopwatch.Stop()
$stopwatch.Elapsed

#Hash is 00-00-02-C6-55-DF-77-38-24-6E-88-F6-C1-C4-3E-B7 and the minimum decimal value is 282749
