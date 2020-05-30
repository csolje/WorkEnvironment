function Set-Size
{
    <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER p

    .NOTES
        Tags: Windows size
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE

    #>
    # Shell
    $Shell=$Host.UI.RawUI
    $size=$Shell.BufferSize
    $size.width=185
    $size.height=9000


    $Shell.BufferSize=$size
    $size=$Shell.WindowSize
    $size.width=185
    $size.height=40
    $Shell.WindowSize=$size

    $Shell.BackgroundColor="Black"
    $Shell.ForegroundColor="White"
    $Shell.CursorSize=10

}