$in=$args[0]
$out=$args[1]
nasm -f bin $in -o bin.img
if($?)
{
	$FileName = Get-item bin.img
	Write-host "Compiled size: $($FileName.length) KB"
	./dd.exe -f bin.img  -o $out -l 440
	if(!$?)
	{
		Write-host "Disk image " -NoNewLine
		Write-host "not found" -ForegroundColor Red -BackgroundColor Black
	}
	Remove-Item $FileName -ErrorAction Ignore
}
else {
	Write-host "Compiled " -NoNewLine
	Write-host "Error" -ForegroundColor Red -BackgroundColor Black
}
