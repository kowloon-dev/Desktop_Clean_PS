# Define target directory for cleaning
$TARGET_DIR = "C:\Users\kowloon\Desktop\test"

# Get directory/file object from TARGET_DIR
$FILES = Get-ChildItem $TARGET_DIR

Add-Type -AssemblyName Microsoft.VisualBasic

foreach ($f in $FILES) {
	if ($f.Name -match '^@') {
		Write-Output "$f is skipped."
	} elseif ($f.Name -match 'desktop.ini'){
		Write-Output "$f is skipped."
	} else {
		if ($f.PSIsContainer) {
			[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($f.FullName,'OnlyErrorDialogs','SendToRecycleBin')
			Write-Output "$f is deleted."
		} else {
			[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($f.FullName,'OnlyErrorDialogs','SendToRecycleBin')
			Write-Output "$f is deleted."
		}
	}
}
