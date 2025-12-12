# 📦 Dotfiles I3WM - Configuração Completa

Uma configuração completa do i3 Window Manager com Polybar integrado, incluindo configurações para cava, dunst, ranger e rofi.

## 🔗 Repositório

```
https://github.com/hudsonalbuquerque97-sys/Dotfiles_I3wm
```

## 📋 Requisitos

Antes de instalar esta configuração, certifique-se de ter os seguintes pacotes instalados:

### Gerenciador de Janelas e Sistema
```bash
sudo apt install i3 i3status i3lock picom dunst nitrogen network-manager-gnome
```

### Terminais e Launchers
```bash
sudo apt install kitty alacritty rofi dmenu suckless-tools
```

### Áudio e Mídia
```bash
sudo apt install pulseaudio pavucontrol playerctl mpv socat mplayer cava cmus
```

### Utilitários do Sistema
```bash
sudo apt install scrot slop jq python3 python3-pip bc wmctrl brightnessctl ranger feh lsd neofetch conky calcurse
```

### Navegadores
```bash
sudo apt install firefox qutebrowser
```

### Bluetooth
```bash
sudo apt install bluez bluez-tools
```

### Fontes
```bash
sudo apt install fonts-jetbrains-mono fonts-font-awesome
```

**Fontes Nerd Font (instalar manualmente):**
- Symbols Nerd Font Mono
- JetBrainsMono Nerd Font
- Font Awesome (versão Nerd Font)

Para instalar as Nerd Fonts, baixe de [https://www.nerdfonts.com/](https://www.nerdfonts.com/) e instale em `~/.local/share/fonts/` ou `/usr/share/fonts/`

**Instalação rápida das Nerd Fonts:**
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# JetBrainsMono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
rm JetBrainsMono.zip

# Symbols Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip -d NerdFontsSymbols
rm NerdFontsSymbolsOnly.zip

# Atualizar cache de fontes
fc-cache -fv
```

### Temas de Ícones
```bash
sudo apt install papirus-icon-theme
```

### Editor de Texto
```bash
sudo apt install geany
```

### PyRadio (via pipx)
```bash
sudo apt install pipx
pipx ensurepath
pipx install pyradio
```

## 📦 Instalação

### 1. Clone o repositório
```bash
cd ~
git clone https://github.com/hudsonalbuquerque97-sys/Dotfiles_I3wm.git
```

### 2. Faça backup das configurações antigas
```bash
# Backup do i3
mv ~/.config/i3 ~/.config/i3.backup

# Backup de outras configurações (se existirem)
mv ~/.config/cava ~/.config/cava.backup
mv ~/.config/dunst ~/.config/dunst.backup
mv ~/.config/ranger ~/.config/ranger.backup
mv ~/.config/rofi ~/.config/rofi.backup
```

### 3. Copie os arquivos de configuração

#### Cava (visualizador de áudio)
```bash
mkdir -p ~/.config/cava
cp -r ~/Dotfiles_I3wm/config/cava/* ~/.config/cava/
```

#### Dunst (notificações)
```bash
mkdir -p ~/.config/dunst
cp -r ~/Dotfiles_I3wm/config/dunst/* ~/.config/dunst/
```

#### Ranger (gerenciador de arquivos)
```bash
mkdir -p ~/.config/ranger
cp -r ~/Dotfiles_I3wm/config/ranger/* ~/.config/ranger/
```

#### Rofi (launcher)
```bash
mkdir -p ~/.config/rofi
cp -r ~/Dotfiles_I3wm/config/rofi/* ~/.config/rofi/
```

#### i3 (incluindo Polybar)
```bash
mkdir -p ~/.config/i3
cp -r ~/Dotfiles_I3wm/config/i3/* ~/.config/i3/
```

**OU copie tudo de uma vez:**
```bash
# Copia todas as configurações
cp -r ~/Dotfiles_I3wm/config/* ~/.config/
```

### 4. Torne os scripts executáveis
```bash
chmod +x ~/.config/i3/polybar/launch.sh
chmod +x ~/.config/i3/polybar/scripts/*.sh
chmod +x ~/.config/i3/polybar/scripts/*.py
chmod +x ~/.config/i3/*.sh
```

### 5. Configure o i3 para usar o Polybar

O arquivo de configuração do i3 já está configurado para usar o Polybar. Certifique-se de que o i3bar está desabilitado:

Edite `~/.config/i3/config` e verifique se o bloco do i3bar está comentado:

```
# bar {
#     status_command i3status
# }
```

E se a linha do Polybar está presente:
```
exec_always --no-startup-id ~/.config/i3/polybar/launch.sh
```

> **Nota:** É importante desabilitar o i3bar para evitar conflitos com o Polybar.

### 6. Reinicie o i3
Pressione `Mod+Shift+R` ou execute:
```bash
i3-msg restart
```

## 📁 Estrutura de Arquivos

```
~/.config/
├── cava/
│   └── config                      # Configuração do visualizador de áudio
├── dunst/
│   └── dunstrc                     # Configuração de notificações
├── ranger/
│   ├── commands.py                 # Comandos personalizados
│   ├── commands_full.py
│   ├── rc.conf                     # Configuração principal
│   ├── rifle.conf                  # Associações de arquivos
│   └── scope.sh                    # Preview de arquivos
├── rofi/
│   └── config.rasi                 # Tema e configuração do Rofi
└── i3/
    ├── config                      # Configuração principal do i3
    ├── slop-scrot.sh               # Script de captura de tela
    └── polybar/
        ├── launch.sh               # Script de inicialização
        ├── config.ini              # Configuração principal (importa módulos)
        ├── modules/                # Módulos separados
        │   ├── colors.ini          # Cores do tema
        │   ├── bar.ini             # Configuração da barra
        │   ├── i3wm.ini            # Módulos do i3WM
        │   ├── media.ini           # Módulos de mídia e áudio
        │   ├── system.ini          # Módulos de sistema
        │   ├── network.ini         # Módulos de rede
        │   └── monitoring.ini      # Monitoramento (opcional)
        └── scripts/                # Scripts auxiliares
            ├── i3-mode.py          # Indica modo mosaico ou flutuante
            ├── i3-resize-indicator.sh    # Indica modo redimensionamento
            ├── workspaces.sh       # Define as áreas de trabalho
            ├── brightness.sh       # Controle de luminosidade
            ├── powermenu.sh        # Menu de opções do sistema
            ├── bluetooth-status.sh # Status do Bluetooth
            ├── bluetooth-toggle.sh # Ativa/desativa Bluetooth
            ├── pyradio-*.sh        # Scripts de estações de rádio
            ├── music-mpd-style.sh  # Controle Playerctl
            ├── mpv-status.sh       # Status do MPV
            └── mpv-start.sh        # Inicialização do MPV
```

## ⚙️ Personalização

### Polybar
Todos os módulos do Polybar estão organizados na pasta `~/.config/i3/polybar/modules/` para facilitar a personalização:

- **colors.ini** - Altere as cores do tema
- **bar.ini** - Configure a aparência da barra
- **i3wm.ini** - Ajuste os módulos específicos do i3
- **media.ini** - Configure reprodutores de mídia
- **system.ini** - Personalize informações do sistema
- **network.ini** - Ajuste módulos de rede

### i3 Window Manager
Edite o arquivo `~/.config/i3/config` para personalizar:
- Atalhos de teclado
- Regras de janelas
- Workspaces
- Aplicações iniciais

### Rofi
Edite `~/.config/rofi/config.rasi` para alterar o tema e comportamento do launcher.

### Dunst
Edite `~/.config/dunst/dunstrc` para personalizar as notificações.

## 🎨 Recursos

Esta configuração inclui:

- ✅ Polybar totalmente configurado e modular
- ✅ Workspaces personalizados
- ✅ Indicadores de modo i3 (mosaico/flutuante/redimensionamento)
- ✅ Controles de mídia (Playerctl, MPV, PyRadio, Cmus)
- ✅ Gerenciamento de Bluetooth
- ✅ Controle de brilho
- ✅ Menu de energia (Power Menu)
- ✅ Visualizador de áudio (Cava)
- ✅ Notificações elegantes (Dunst)
- ✅ Launcher customizado (Rofi)
- ✅ Gerenciador de arquivos no terminal (Ranger)
- ✅ Listagem de diretórios moderna (LSD)
- ✅ Informações do sistema (Neofetch)
- ✅ Widget de sistema (Conky)
- ✅ Calendário e tarefas (Calcurse)
- ✅ Navegador minimalista (Qutebrowser)

## 🐛 Solução de Problemas

### Polybar não inicia
```bash
# Verifique erros no log
~/.config/i3/polybar/launch.sh

# Teste manualmente
killall -q polybar
polybar mybar 2>&1 | tee /tmp/polybar.log
```

### Ícones não aparecem corretamente
Certifique-se de que as Nerd Fonts estão instaladas:
```bash
fc-list | grep -i nerd
```

### Scripts não funcionam
Verifique permissões de execução:
```bash
ls -la ~/.config/i3/polybar/scripts/
chmod +x ~/.config/i3/polybar/scripts/*
```

### Dunst não mostra notificações
```bash
# Reinicie o dunst
killall dunst
dunst &
```

### Rofi não abre
```bash
# Teste o rofi
rofi -show drun
```

## 📝 Atalhos Úteis (padrão i3)

- `Mod+Enter` - Abrir terminal
- `Mod+d` - Abrir Rofi (launcher)
- `Mod+x` - Abrir dmenu (launcher)
- `Mod+q` - Fechar janela
- `Mod+Shift+r` - Recarregar i3
- `Mod+Shift+e` - Sair do i3

> **Nota:** Verifique o arquivo `~/.config/i3/config` para ver todos os atalhos personalizados.

## 📞 Suporte

**Criado por:** Hudson Albuquerque  
**Email:** hud.and@yandex.com  
**Repositório:** https://github.com/hudsonalbuquerque97-sys/Dotfiles_I3wm

---

## 📝 Licença

Consulte o repositório para informações sobre licença.

## 🤝 Contribuições

Contribuições são bem-vindas! Visite o repositório no GitHub para reportar problemas ou sugerir melhorias.

---

**Dica:** Use `Ctrl+F` para buscar rapidamente configurações específicas neste README!
