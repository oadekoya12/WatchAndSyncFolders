
# Watch and Sync Folders Using PowerShell

This project demonstrates how to use PowerShell to create a custom script that monitors changes in a folder and synchronizes them to another directory. It's designed for use on **Windows 11** and can be adapted for other Windows versions.

## Features
- Automatically monitors a source folder for changes (additions, deletions, or modifications).
- Synchronizes the contents of the source folder to a destination folder.
- Supports nested directories and maintains their structure.
- Ensures that an external drive (or specified destination drive) is connected before syncing.

## Prerequisites
1. **Windows 11** (or another Windows version with PowerShell 5.1 or later).
2. Basic understanding of PowerShell commands (optional but helpful).

## How to Set Up

### 1. Clone or Download the Script
Download the `WatchAndSyncFolders.ps1` script from this repository.

### 2. Prepare Your Source and Destination Folders
- **Source Folder**: This is the folder you want to monitor for changes.
- **Destination Folder**: This is the folder where changes will be synced.

### 3. Test the Script
1. Open PowerShell as Administrator.
2. Navigate to the directory where the script is saved.
3. Run the following command, replacing the paths with your own:
   ```powershell
   .\WatchAndSyncFolders.ps1 -FromPath "C:\Path\To\Source" -ToPath "D:\Path\To\Destination"
   ```

### 4. Add the Script to Run on Startup (Optional)
To ensure the script runs automatically when you log in, you can add it to the Windows Startup folder:
1. **Create a Shortcut**:
   - Right-click on the script file, select **Create Shortcut**.
   - Edit the shortcut target to look like this:
     ```plaintext
     powershell.exe -WindowStyle Hidden -File "C:\Path\To\WatchAndSyncFolders.ps1"
     ```

2. **Move to Startup Folder**:
   - Press `Win + R`, type `shell:startup`, and press Enter.
   - Move the shortcut to the Startup folder.

## Script Explanation
### Parameters
- `-FromPath`: The folder to monitor for changes.
- `-ToPath`: The folder where changes will be synced.

### Functionality
1. **Check External Drive**: Verifies if the destination drive is connected. If not, the script exits.
2. **Initial Sync**: Copies all existing files and folders from the source to the destination.
3. **Monitor Changes**: Continuously watches the source folder for changes and syncs them to the destination in real time.

### Example Use Case
- **Backup Files**: Automatically sync important files to an external drive for backup.
- **Collaborative Work**: Sync shared project folders between team members.

## Common Errors and Solutions

### Error: `Variable reference is not valid`
- Ensure the script uses proper syntax for variable references, such as `${VariableName}`.

### Error: `Access Denied`
- Run PowerShell as Administrator and ensure you have permissions for both source and destination folders.

### Error: `Path Not Found`
- Double-check that the source and destination paths exist.

## Advanced Customization
- **Add Logging**: Modify the script to log sync operations for auditing purposes.
- **Change File Types**: Update the script to sync specific file types by modifying the `Copy-Item` command.

## License
This project is open-source and can be freely modified or redistributed.

## Support
For questions or suggestions, please contact the project maintainer.

---

Enjoy automating your folder synchronization with PowerShell!
