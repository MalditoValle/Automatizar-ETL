# Define el directorio de origen y el tipo de archivo a buscar
$folder = "C:\Users\56978\Desktop\Nueva carpeta\Nuevos\ing"
$filter = "*.xlsx"

# Crea un objeto FileSystemWatcher para monitorear el directorio
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folder
$watcher.Filter = $filter
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

# Define la acción que se tomará cuando se detecte un nuevo archivo
$action = {
    $path = $Event.SourceEventArgs.FullPath
    $name = $Event.SourceEventArgs.Name
    $changeType = $Event.SourceEventArgs.ChangeType
    $timeStamp = $Event.TimeGenerated
    Write-Host "Se detectó el archivo $name en $timeStamp"
    # Llamar al paquete SSIS para cargar los datos del archivo en la base de datos
}

# Registra la acción en el evento Created del objeto FileSystemWatcher
Register-ObjectEvent $watcher "Created" -Action $action