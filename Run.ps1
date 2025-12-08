
$req = "$env:TEMP\req.txt"

pip.exe freeze > $req

pip.exe uninstall -r $req -y