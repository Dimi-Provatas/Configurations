# Prompt
Import-Module posh-git

# Load Prompt Config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'sheepstress.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# ReadLine Config
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf Config
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias open ii
Set-Alias locate where.exe
Set-Alias python python3
Set-Alias vim nvim

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function linux ($name) {
    qemu-system-x86_64.exe -m 4G -smp 4 -vga virtio -display gtk -machine smm=off -usbdevice tablet -net nic -net user -drive file="C:\Users\Sheepstress\Desktop\VMs\$name\linux.img"
}

function linux-new ($name) {
    # Copy the default empty installation image
    cp "C:\Users\Sheepstress\Desktop\VMs\$name\linux-new.img" "C:\Users\Sheepstress\Desktop\VMs\$name\linux.img"
    qemu-system-x86_64.exe -m 4G -smp 4 -vga virtio -display gtk -machine smm=off -usbdevice tablet -net nic -net user -drive file="C:\Users\Sheepstress\Desktop\VMs\$name\linux.img"
}

function linux-install ($name) {
    # Create a new image from scratch and boot with the iso as cdrom
    qemu-img create -f qcow2 "C:\Users\Sheepstress\Desktop\VMs\$name\linux-new.img" 20G
    cp "C:\Users\Sheepstress\Desktop\VMs\$name\linux-new.img" "C:\Users\Sheepstress\Desktop\VMs\$name\linux.img"
    qemu-system-x86_64 -m 4G -smp 4 -vga virtio -display gtk -machine smm=off -usbdevice tablet -net nic -net user -drive file="C:\Users\Sheepstress\Desktop\VMs\$name\linux.img",if=virtio -boot order=dc -cdrom "C:\User\Sheepstress\Desktop\VMs\$name\$name.img"
}

function wtr () {
  curl wttr.in
}

function toJPG () {
    foreach ($image in Get-ChildItem -Attributes !Directory+!Compressed .)
    {
        if ($image.Extension -eq ".jpg")
        {
            continue;
        }

        if (
            $image.Extension -eq ".mp4" ||
            $image.Extension -eq ".gif"
        ) {
            rm $image;
            continue;
        }

        $name = $image.name;

        echo "Handling file: $name";
        mogrify -format jpg $name;
        rm $name;
    }
}

# Run on startup
Clear-Host

neofetch
