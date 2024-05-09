$Host.UI.RawUI.BackgroundColor = "Black"
[Console]::BackgroundColor = "Black"
$ErrorActionPreference = "Stop"

function Write-HyphenToEnd {
    $consoleWidth = [Console]::WindowWidth
    Write-Host ("-" * $consoleWidth)
}

function Write-CatHeader {
    $width = $Host.UI.RawUI.BufferSize.Width
    
    $asciiArt1 = "    |\__/,|   (`\"
    $asciiArt2 = "  _.|o o  |_   ) )"
    $asciiArt3 = "-(((---(((--------"

    # Calculate the number of dashes needed to pad the ASCII art to match the width
    $padding = ($width - $asciiArt3.Length)
	$dashLine = '-' * ($width - 19)
	
    # Output ASCII art 1 and 2 with appropriate padding
	#Write-Host ""
	Write-Host (" " * ($padding - 95))"#####--- Shortcut Creator Tool Program Script ---#####"
    Write-Host (" " * ($padding - 1))$asciiArt1
    Write-Host (" " * ($padding - 1))$asciiArt2
	Write-Host $dashLine $asciiArt3
    #Write-Host (" " * ($padding - 2))$asciiArt3 -NoNewLine

    
}

function Get-ClownPuke {
    param([string]$Text)

    # Use a random colour for each character
    $Text.ToCharArray() | ForEach-Object {
        switch -Regex ($_){
            # Ignore new line characters
            "`r" {
                break
            }
            # Start a new line
            "`n" {
                Write-Host " "; break
            }
            # Use random colours for displaying this non-space character
            "[^ ]" {
                # Get all available console colors except Black
                $availableColors = [System.Enum]::GetValues([System.ConsoleColor]) | Where-Object { $_ -ne "Black" }
                # Choose a random color from the available colors
                $foregroundColor = $availableColors | Get-Random
                # Splat the colors to Write-Host
                $writeHostOptions = @{
                    ForegroundColor = $foregroundColor
                    NoNewLine = $true
                }
                Write-Host $_ @writeHostOptions
                break
            }
            " " {
                Write-Host " " -NoNewline
            }
        } 
    }
}


function Test-PathEx {
    param (
        [string]$Path
    )

    $pathValid = Test-Path $Path
    if ($pathValid -eq 'True') {
        Write-Host "[+] Path Valid: $path"
    } else {
        Write-Host "[E] Error. Path '$Path' does not exist."
		Write-Host "Abortion. Exiting."
		Pause
		exit
    }
}



cls
$splashAscii = @"
 ___              _         _     _           _____                  
(  _ \           ( )_      ( )   (_ )        (  _  )                 
| |_) )  _   _ __|  _)  _ _| |_   | |   __   | (_) |_ _   _ _    ___ 
|  __/ / _ \(  __) |  / _  )  _ \ | | / __ \ (  _  )  _ \(  _ \/  __)
| |   ( (_) ) |  | |_( (_| | |_) )| |(  ___/ | | | | (_) ) (_) )__  \
(_)    \___/(_)   \__)\__ _)_ __/(___)\____) (_) (_)  __/|  __/(____/
                                                   | |   | |         
                                                   (_)   (_)         
												   
 ___   _                _               _     ___                    _              
(  _ \( )              ( )_            ( )_  (  _ \                 ( )_            
| (_(_) |__    _   _ __|  _)  ___ _   _|  _) | ( (_)_ __   __    _ _|  _)  _   _ __ 
 \__ \|  _  \/ _ \(  __) |  / ___) ) ( ) |   | |  _(  __)/ __ \/ _  ) |  / _ \(  __)
( )_) | | | | (_) ) |  | |_( (___| (_) | |_  | (_( ) |  (  ___/ (_| | |_( (_) ) |   
 \____)_) (_)\___/(_)   \__)\____)\___/ \__) (____/(_)   \____)\__ _)\__)\___/(_)   
                                                                                    
 
 _____             _     ___           ___ _                              
(_   _)           (_ )  (  _ \       / ___) )_                            
  | |    _     _   | |  | (_(_)  _  | (__ |  _)_   _   _   _ _ _ __   __  
  | |  / _ \ / _ \ | |   \__ \ / _ \|  __)| | ( ) ( ) ( )/ _  )  __)/ __ \
  | | ( (_) ) (_) )| |  ( )_) | (_) ) |   | |_| \_/ \_/ | (_| | |  (  ___/
  (_)  \___/ \___/(___)  \____)\___/(_)    \__)\__/\___/ \__ _)_)   \____)
                                                                          
                                                                          
 ___                      _   
(  _ \            _      ( )_ 		
| (_(_)  ___ _ __(_)_ _  |  _)
 \__ \ / ___)  __) |  _ \| |  			 
( )_) | (___| |  | | (_) ) |_			 
 \____)\____)_)  (_)  __/ \__)			  
                   | |        
                   (_)        					--WhaleLinguini

                                                                                   
"@

$splashFinished = @"                                                                              
                                                                    _______       
          .--.   _..._   .--.           .              __.....__    \  ___ `'.    
     _.._ |__| .'     '. |__|         .'|          .-''         '.   ' |--.\  \   
   .' .._|.--..   .-.   ..--.        <  |         /     .-''"'-.  `. | |    \  '  
   | '    |  ||  '   '  ||  |         | |        /     /________\   \| |     |  ' 
 __| |__  |  ||  |   |  ||  |     _   | | .'''-. |                  || |     |  | 
|__   __| |  ||  |   |  ||  |   .' |  | |/.'''. \\    .-------------'| |     ' .' 
   | |    |  ||  |   |  ||  |  .   | /|  /    | | \    '-.____...---.| |___.' /'  
   | |    |__||  |   |  ||__|.'.'| |//| |     | |  `.             .'/_______.'/   
   | |        |  |   |  |  .'.'.-'  / | |     | |    `''-...... -'  \_______|/    
   | |        |  |   |  |  .'   \_.'  | '.    | '.                                
   |_|        '--'   '--'             '---'   '---'                               

"@

$splashGoodbye = @"
					  _   _   _   _   _   _  
					 / \ / \ / \ / \ / \ / \ 
					( G | o | o | b | y | e )
					 \_/ \_/ \_/ \_/ \_/ \_/ 

									--WhaleLinguini
"@

Write-CatHeader
Write-Host " "
Get-ClownPuke $splashAscii
write-Host " "
Write-HyphenToEnd

Write-Host "Reticulating Splines " -NoNewLine
$Symbols = [string[]]('|','/','-','\')
$SymbolIndex = [byte] 0
$Job = Start-Job -ScriptBlock { Start-Sleep -Seconds 3 }
while ($Job.'JobStateInfo'.'State' -eq 'Running') {
    if ($SymbolIndex -ge $Symbols.'Count') {$SymbolIndex = [byte] 0}
    Write-Host -NoNewline -Object ("{0}`b" -f $Symbols[$SymbolIndex++])
    Start-Sleep -Milliseconds 200
}


cls
Write-CatHeader
Write-Host " "
# Prompt user for the root path to search
$rootPath = Read-Host "Enter the root path to search for portable apps (e.g., C:\Users\User\PortableApps)"
Test-PathEx $rootPath

Write-Host "Parsing portable directory for *portable.exe's ..."
Start-Sleep -Milliseconds 200

# Check if the directory exists, if not create it
$folderPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PortableApps"
if (-not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath -Force
}

# Search for executables ending with 'portable.exe' in subdirectories
$exeFiles = Get-ChildItem -Path $rootPath -Recurse -Filter "*portable.exe" -File

# Create shortcuts for the executables
foreach ($exeFile in $exeFiles) {
    $shortcutPath = Join-Path -Path $folderPath -ChildPath ($exeFile.BaseName + ".lnk")
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($shortcutPath)
    $Shortcut.TargetPath = $exeFile.FullName
    $Shortcut.Save()
	Write-Host "Shortcut created for $exeFile"
	Start-Sleep -Milliseconds 100
}

Write-Host "Shortcuts for PortableApps created successfully!"
Write-Host " "
Get-ClownPuke $splashFinished
Write-Host ""
Get-ClownPuke $splashGoodbye
Write-Host ""
Write-Host " "
Start-Sleep -Seconds 1

# Open the directory
Invoke-Item $folderPath
pause
