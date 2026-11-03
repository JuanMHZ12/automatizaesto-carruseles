# Uso: powershell -File to_jpg.ps1 <carpeta_carrusel>
# Convierte master\NN_*.png -> exports\social\NN_*.jpg (JPEG calidad 95, sRGB, misma resolución, aplanado sobre el fondo).
param([Parameter(Mandatory)][string]$Folder)
Add-Type -AssemblyName System.Drawing
$codec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
$q = New-Object Drawing.Imaging.EncoderParameters 1
$q.Param[0] = New-Object Drawing.Imaging.EncoderParameter ([Drawing.Imaging.Encoder]::Quality), 95L
$out = Join-Path $Folder 'exports\social'
New-Item -ItemType Directory -Force $out | Out-Null
Get-ChildItem (Join-Path $Folder 'master') -Filter *.png | Sort-Object Name | ForEach-Object {
  $src = [Drawing.Image]::FromFile($_.FullName)
  $bmp = New-Object Drawing.Bitmap $src.Width, $src.Height, ([Drawing.Imaging.PixelFormat]::Format24bppRgb)
  $g = [Drawing.Graphics]::FromImage($bmp)
  $g.Clear([Drawing.Color]::FromArgb(7, 9, 13))   # fondo #07090d por si hubiera transparencia
  $g.DrawImage($src, 0, 0, $src.Width, $src.Height); $g.Dispose()
  $dst = Join-Path $out ($_.BaseName + '.jpg')
  $bmp.Save($dst, $codec, $q); $bmp.Dispose(); $src.Dispose()
  "{0} -> {1} ({2}x{3})" -f $_.Name, (Split-Path $dst -Leaf), $src.Width, $src.Height
}
