$location  = Get-Location

$location.Path

$strPath = $location.Path + '\..\MvvX.Autofac.Extras\bin\Release\MvvX.Autofac.Extras.dll'

$strPath

$Assembly = [Reflection.Assembly]::Loadfile($strPath)
$AssemblyName = $Assembly.GetName()
$Assemblyversion =  $AssemblyName.version
$Assemblyversion
$nuSpecFile =  $location.Path + '\MvvX.Autofac.Extras.nuspec'

(Get-Content $nuSpecFile) | 
Foreach-Object {$_ -replace "(<version>([0-9.]+)<\/version>)", "<version>$Assemblyversion</version>" } | 
Set-Content $nuSpecFile

.\NuGet pack MvvX.Autofac.Extras.nuspec