#variables
#
# Set the min and max numbers based on the digits in the numbers
function get-palindrome {
    param($number) 
    <#
    #>   
    $inverted = get-inverted $number
    $strnumber = $number.tostring()                
    if ($strnumber -eq $inverted) {
        return $true
    } else {
        return $false
    }
}
function get-range {
    param ($digits)
[int32]$max = [Math]::Pow(10, $digits)
[int32]$min = [Math]::Pow(10, ($digits-1))
$range = $max..$min
return $range}

function get-palindromerange {
    param ($digits)
[int32]$max = [Math]::Pow(10, $digits)-1
$range = $max..($max/2)
return $range}

# Determine if a number is a palindrome
function get-inverted 
{
    Param ($product)
    # Test is the original value that will be inverted
    $test = $product
    # Convert the number into a string
    $string = $test.tostring() 
    # Adds the characters to the 
    $arr = $string.tochararray()
    [array]::Reverse($arr)
    $inverted = -join($arr)
    $inverted
#https://devblogs.microsoft.com/scripting/reverse-strings-with-powershell/
}
# Create a range of 999*(999..100)
#forloop to decrease the max number by 1 and go through the range again
# create array of palindrome
function get-largestpalindrome {
    param()
    $Palindromes = @()
    $Remnumbers =@()
    $digits = read-host "Enter number of digits"
    $range = get-palindromerange $digits
    foreach ($number in $range) {
        if (!($remnumbers.Contains($number))){ 
            foreach ($n in $range) {
                if (!($remnumbers.Contains($n))){                
                    $product = $n*$number
                    "product: $product, Number: $number, N: $N"
                    if (get-palindrome $product) {
                        "palindrome: $product"
                        $Palindromes += $product
                        $Remnumbers += $n
                        break
                
                    }
                }
            }
            
        }
    }
    $Palindromes |select -uniq |sort -Descending
}

function get-factors
{
    Param ($target)
    $test = 2
    $sqroot = [math]::sqrt($target)
    $round = [math]::round($sqroot, 0) + 1
    $arr = @()
    # While loop to determine the factors of the Target number from 2 to the square root of the target number
    while ($test -le $Target) {
        if ($target % $test -eq 0) {
            # Getting the second half of the Factors
            $Largerfactor = $target/$test
            # Add factors to array
            $arr += $test
            $arr += $largerfactor
        }
        $test = $test + 1
    }
   $arr |select -uniq |sort -Descending
}
function get-tabledfactors {
    param($dookie)
$table = [ordered] @{}
$arr = get-factors $dookie        
$Table.add($dookie,$arr)     

$table
}
function get-prime {
    Param ($target)
    $test = 1
    $sqroot = [math]::sqrt($target)
    $round = [math]::round($sqroot, 0) + 1
    # While loop to determine the factors of the Target number from 2 to the square root of the target number
    while ($test -le $round) {
        if($target -eq 2){
            return $true
            break
        }
        if ($target -eq 3){
            return $true
            break
        }
        if ($test -gt 1 -and $target % $test -eq 0) {
            Return $false
            break
        } 
        $test = $test + 1
    } Return $true
}
function get-Primeposition {
    Param($Position)
    $arr = @()
    $start = 2

    while ($arr.count -lt $Position){
        #"Number = $start"
        if (get-prime $start){
            $arr += $start
            $total = $arr.count
            #$hash =[pscustomobject]@{PrimeNumber="$start";PrimePosition="$total"}
            #"PrimeNumber = $start Prime position= ($total)"        
        }$start = $start + 1
        #$hash | select -Uniq
    }"PrimeNumber = $($start - 1) Prime position= ($total)"
}
function Get-product {
    Param($factor1,$Factor2)
    $addedfactor = $factor1
    $test = 2
    while ($test -le $factor2) {
        $product = $factor1 + $addedfactor
        $addedfactor = $product
        $test = $test + 1
    }
    return $product
}

function Get-productarray {
    [cmdletbinding()]
    Param([int64[]]$factors)
    Write-Debug "$($factors)"
    foreach ($factor in $factors) {
        if ($factor -eq 0) {
            write-debug "true"
            $product = 0
            return $product
        }
    }
    $range = $factors[0..($factors.length -1)]
    $array = @()
    $f = 0
    $test = 1
    $product = $factors[$f]
    $count = $factors.count
    while ($test -lt $count) {
        $p = get-product $product $factors[$f + 1]
        $product = $p
        $f++
        $test++
    } return $product
}

function check-Pythagoreantriplet {
    [cmdletbinding()]
    param([int]$a,[int]$b,[int]$c)
    $asquared = [math]::pow($a,2)
    $bsquared = [math]::pow($b,2)
    $csquared = [math]::pow($c,2)
    write-debug "$asquared"
    if (($asquared + $bsquared) -eq $csquared) {
        return $True
    } return $false
}
function sum-ofsquares {
    param([int]$a,[int]$b,[int]$c)
    $asquared = [math]::pow($a,2)
    $bsquared = [math]::pow($b,2)
    $csquared = [math]::pow($c,2)
    $sum = $asquared + $bsquared + $csquared
    return $sum
}

function get-sum {
    param([int64[]]$factors)
    $sum = 0
    $factors | Foreach { $sum += $_}
    return $sum
}

function test-sum {
    param([int]$a,[int]$b,[int]$c)
    $sum = $a + $b + $c
    return $sum
} 

function get-Pythagtrip {
    [cmdletbinding()]
    param($a,$b,$c)
    $asquared = $a * $a
    $bsquared = $b * $b
    $csquared = $c * $c
    if ($asquared + $bsquared -eq $csquared) {
        return $true
    } return $false
}