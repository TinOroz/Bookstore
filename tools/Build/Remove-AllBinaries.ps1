# Deletes all build outputs and temporary files, for testing and debugging purpose.

$ErrorActionPreference = 'Stop'

& "$PSScriptRoot\Remove-RhetosServer.ps1"

$nugetCacheFolders = Get-ChildItem "$PSScriptRoot\..\.." -Recurse -Directory -Filter "packages"
$nugetCacheFolders | Remove-Item -Recurse -Force

$binFolders = Get-ChildItem "$PSScriptRoot\..\..\src", "$PSScriptRoot\..\..\test" -Recurse -Directory -In "bin", "obj"
$binFolders | Remove-Item -Recurse -Force

if (Test-Path 'dist\BookstorePackage')
  { Remove-Item 'dist\BookstorePackage' -Recurse }
