# Ruta al ejecutable dtexec.exe
$dtexecPath = "C:\Program Files\Microsoft SQL Server\150\DTS\Binn\DTExec.exe"

# Ruta al archivo .dtsx del paquete SSIS
$packagePath = "C:\Users\56978\source\repos\FTP\FTP\Ing_oper.dtsx"

# Opciones de ejecución del paquete SSIS
$options = "/F `"$packagePath`" /Conf `"$configFile`""

# Ejecuta el paquete SSIS utilizando dtexec.exe
Start-Process -FilePath $dtexecPath -ArgumentList $options -NoNewWindow -Wait
