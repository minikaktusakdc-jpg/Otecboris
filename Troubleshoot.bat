```bat
@echo off
setlocal

powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command ^
"Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; ^
[System.Windows.Forms.Application]::EnableVisualStyles(); ^
$form = New-Object System.Windows.Forms.Form; ^
$form.Text = 'Troubleshoot!'; ^
$form.Size = New-Object System.Drawing.Size(450,300); ^
$form.StartPosition = 'CenterScreen'; ^
$form.FormBorderStyle = 'FixedSingle'; ^
$form.MaximizeBox = $false; ^
$form.BackColor = [System.Drawing.Color]::FromArgb(30,30,30); ^

$title = New-Object System.Windows.Forms.Label; ^
$title.Text = 'Vitajte ' + $env:USERNAME + '!'; ^
$title.ForeColor = [System.Drawing.Color]::White; ^
$title.Font = New-Object System.Drawing.Font('Segoe UI',20,[System.Drawing.FontStyle]::Bold); ^
$title.AutoSize = $true; ^
$title.Location = New-Object System.Drawing.Point(105,35); ^
$form.Controls.Add($title); ^

$licencia = New-Object System.Windows.Forms.Button; ^
$licencia.Text = 'Licencia'; ^
$licencia.Font = New-Object System.Drawing.Font('Segoe UI',12); ^
$licencia.Size = New-Object System.Drawing.Size(280,55); ^
$licencia.Location = New-Object System.Drawing.Point(75,95); ^
$licencia.Add_Click({ ^
    Start-Process -FilePath 'cmd.exe' -ArgumentList '/c ""%ProgramFiles%\Troubleshoot\licencia.bat""' -Verb RunAs -WindowStyle Minimized ^
}); ^
$form.Controls.Add($licencia); ^

$vsetko = New-Object System.Windows.Forms.Button; ^
$vsetko.Text = 'Vsetko funguje'; ^
$vsetko.Font = New-Object System.Drawing.Font('Segoe UI',12); ^
$vsetko.Size = New-Object System.Drawing.Size(280,55); ^
$vsetko.Location = New-Object System.Drawing.Point(75,165); ^
$vsetko.Add_Click({ $form.Close() }); ^
$form.Controls.Add($vsetko); ^

[void]$form.ShowDialog()"

endlocal
exit /b
```
