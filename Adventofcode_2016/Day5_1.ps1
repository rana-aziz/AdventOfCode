#Day5 - Part one

$puzzle="ugkcyxxp"

function GetHash{
    param(
        [int]$integer 
    )
do{
     $someString = $puzzle + $integer
     $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
     $utf8 = New-Object -TypeName System.Text.UTF8Encoding
     $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString)))
     $integer++
}until ($hash.StartsWith("00-00-0"))
 if($hash -match '00-00-0(.).*'){
 $cahr = $Matches.1
 }
return $integer, $cahr

}

$nextInteger=0
$Password = ""
for($i=1; $i-le 8; $i++){
$nextInteger, $cahr = Gethash -integer $nextInteger
$Password+=$cahr
Write-Host "This is round number $i"
Write-Host "Password so far is $Password"
Write-Host "Current ineteger is $nextInteger"
}

Write-Host "Door password is $Password"

#answer D4CD2EE1
