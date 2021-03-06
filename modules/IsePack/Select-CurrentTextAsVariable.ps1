function Select-CurrentTextAsVariable {   
    <#
    .Synopsis
        Attempts to select the current text as a type
    .Description
        Attempts to select the current text as a type.
        Will not display errors for selections that could not be coerced into a 
        type.
    .Example
        Select-CurrentTextAsType
    #>
    param()
    Select-CurrentText | 
        ForEach-Object {
            if (-not $_) { return } 
            $text = $_
            if ($text -like '$*') {
                $text.Trim('$ ') | Get-Variable -ErrorAction SilentlyContinue
            } else {
                $text | Get-Variable -ErrorAction SilentlyContinue
            }
        }
}
