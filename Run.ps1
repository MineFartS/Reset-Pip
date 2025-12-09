
$req = "$env:TEMP\req.txt"

pip.exe freeze > $req

pip.exe uninstall -r $req -y

pip.exe cache purge

Get-PSDrive `
    -PSProvider FileSystem `
    `
| Select-Object `
    -ExpandProperty Name `
    `
| ForEach-Object -Process {

    Get-ChildItem `
        -Path "$($_):\" `
        -Recurse `
        -Directory `
        -ErrorAction SilentlyContinue `
    | Where-Object Name -eq "__pycache__" `
    | ForEach-Object -Process {

        Remove-Item `
            -Path $_.FullName `
            -Force -Recurse -Verbose
        
    }


}