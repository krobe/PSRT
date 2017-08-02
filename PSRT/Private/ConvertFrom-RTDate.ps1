﻿function ConvertFrom-RTDate {
    <#
    .SYNOPSIS
       Convert from RT's date format
    .DESCRIPTION
       Convert from RT's date format
    .EXAMPLE
       ConvertFrom-RTDate -DateString $Response.Created
    #>
    param($DateString)
    $Date = $DateString -split '\s'
    $Month = switch ($x)
             {
                 'jan' {1}
                 'feb' {2}
                 'mar' {3}
                 'apr' {4}
                 'may' {5}
                 'jun' {6}
                 'jul' {7}
                 'aug' {8}
                 'sep' {9}
                 'oct' {10}
                 'nov' {11}
                 'dec' {12}
                 default {(Get-Date).Month}
             }
    $Day = $Date[2]
    $Hour = ( $Date[3] -split ':')[0]
    $Minute = ( $Date[3] -split ':')[1]
    $Year = $Date[4]
    Get-Date -Year $Year -Month $Month -Day $Day -Hour $Hour -Minute $Minute
}