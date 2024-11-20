param (
    [string]$FromPath,
    [string]$ToPath
)

# Function to check if the external drive is plugged in
function Test-Drive {
    param ($DriveLetter)
    $drives = Get-PSDrive -PSProvider FileSystem
    return $drives.Name -contains $DriveLetter
}

# Extract drive letter from the ToPath
$driveLetter = ($ToPath -split ':')[0]

# Check if the external drive is plugged in
if (Test-Drive $driveLetter) {
    Write-Output "Drive ${driveLetter}: is plugged in."
} else {
    Write-Output "Drive ${driveLetter}: is not plugged in. Please connect the external drive."
    exit
}

# Copy files from FromPath to ToPath
Copy-Item -Path "$FromPath\*" -Destination $ToPath -Recurse -Force

# Monitor FromPath for changes
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $FromPath
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Define actions on file changes
Register-ObjectEvent $watcher 'Changed' -Action {
    Copy-Item -Path "$FromPath\*" -Destination $ToPath -Recurse -Force
}

# Keep the script running
while ($true) {
    Start-Sleep -Seconds 1
}
