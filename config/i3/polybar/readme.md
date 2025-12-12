# 📦 Polybar Modular - Guia de Instalação

Configuração modularizada do Polybar para facilitar manutenção e personalização.

## 📁 Estrutura de Diretórios

```
~/.config/polybar/
├── config.ini              # Arquivo principal (importa todos os módulos)
├── modules/                # Pasta com módulos separados
│   ├── colors.ini         # Cores do tema
│   ├── bar.ini            # Configuração da barra
│   ├── i3wm.ini           # Módulos do i3WM
│   ├── media.ini          # Módulos de mídia e áudio
│   ├── system.ini         # Módulos de sistema
│   ├── network.ini        # Módulos de rede
│   └── monitoring.ini     # Monitoramento (opcional)
├── scripts/               # Scripts do i3, brightness, power menu, etc
│   ├── i3-mode.py
│   ├── i3-resize-indicator.sh
│   ├── workspaces.sh
│   ├── brightness.sh
│   ├── powermenu.sh
│   ├── bluetooth-status.sh
│   ├── bluetooth-toggle.sh
│   └── pyradio-*.sh
├── music-mpd-style.sh     # Script de música (raiz)
├── mpv-status.sh          # Script MPV status (raiz)
└── mpv-start.sh           # Script MPV start (raiz)
```

## 📂 Organização dos Scripts

Seu config mantém scripts em **dois locais diferentes**:

### 📍 Scripts na raiz (`~/.config/polybar/`)
Estes ficam diretamente na pasta do Polybar:
- `music-mpd-style.sh` - Controle de música MPD
- `mpv-status.sh` - Status do player MPV
- `mpv-start.sh` - Iniciar MPV

### 📍 Scripts na subpasta (`~/.config/polybar/scripts/`)
Estes ficam dentro da pasta `scripts/`:
- `i3-mode.py` - Detectar modo i3 (Python)
- `i3-resize-indicator.sh` - Indicador resize
- `workspaces.sh` - Gerenciamento de workspaces
- `brightness.sh` - Controle de brilho
- `powermenu.sh` - Menu de energia
- `bluetooth-status.sh` - Status Bluetooth (opcional)
- `bluetooth-toggle.sh` - Toggle Bluetooth (opcional)
- `pyradio-status.sh` - Status Pyradio (opcional)
- `pyradio-control.sh` - Controle Pyradio (opcional)

**💡 Importante:** Os caminhos nos módulos já estão corretos! Não precisa mover nenhum script.

---

## 🚀 Como Instalar

### 1. Criar estrutura de pastas

```bash
cd ~/.config/polybar
mkdir -p modules
```

### 2. Fazer backup da configuração antiga

```bash
mv config.ini config.ini.backup
```

### 3. Criar os arquivos modulares

Copie o conteúdo de cada arquivo modular para:
- `config.ini` (arquivo principal)
- `modules/colors.ini`
- `modules/bar.ini`
- `modules/i3wm.ini`
- `modules/media.ini`
- `modules/system.ini`
- `modules/network.ini`
- `modules/monitoring.ini`

### 4. Recarregar Polybar

```bash
polybar-msg cmd restart
# ou
killall polybar && polybar main &
```

## ✨ Vantagens da Organização Modular

### 📋 **Navegação Simples**
- Cada módulo tem sua responsabilidade específica
- Fácil encontrar o que precisa editar
- Comentários claros em cada seção

### 🎨 **Personalização Fácil**
- Quer mudar cores? Edite apenas `modules/colors.ini`
- Quer reorganizar módulos? Edite apenas `modules/bar.ini`
- Quer desativar monitoramento? Comente em `monitoring.ini`

### 🔧 **Manutenção**
- Menos conflitos ao editar
- Testes isolados por módulo
- Backup seletivo de configurações

### 🔄 **Reutilização**
- Compartilhe módulos específicos
- Use temas diferentes (troque apenas `colors.ini`)
- Crie variações facilmente

## 📝 Editando Módulos

### Adicionar novo módulo à barra

1. Edite `modules/bar.ini`
2. Adicione o nome do módulo em `modules-left`, `modules-center` ou `modules-right`

### Mudar esquema de cores

1. Edite `modules/colors.ini`
2. Salve e recarregue o Polybar

### Ativar módulos opcionais

1. Abra o arquivo do módulo correspondente
2. Descomente as linhas (remova o `;` no início)
3. Adicione o módulo em `modules/bar.ini`

## 🎯 Módulos Disponíveis

### ✅ Ativos por Padrão
- `i3-mode` - Modo de janela (mosaico/flutuante)
- `workspaces` - Áreas de trabalho
- `i3-resize` - Indicador de redimensionamento
- `mpv-control` - Controle do MPV
- `music-mpd` - Player de música
- `brightness` - Controle de brilho
- `volume` - Controle de volume
- `network` - Status de rede
- `tray` - Bandeja do sistema
- `date` - Data e hora
- `sysmenu` - Menu de energia

### 💡 Opcionais (Desativados)
- `pyradio` - Rádio online
- `bluetooth` - Status Bluetooth
- `cpu` - Uso de CPU
- `memory` - Uso de memória
- `filesystem` - Uso de disco
- `battery` - Bateria (laptops)
- `launcher` - Lançador de apps

## 🐛 Solução de Problemas

### Polybar não inicia
```bash
polybar main 2>&1 | tee /tmp/polybar.log
```

### Módulo não aparece
1. Verifique se está listado em `modules/bar.ini`
2. Verifique se o arquivo do módulo existe
3. Verifique erros no log

### Erro de include
Certifique-se que os caminhos em `config.ini` estão corretos:
```ini
include-file = ~/.config/polybar/modules/colors.ini
```

## 📞 Suporte

Criado por: Hudson Albuquerque (hud.and@yandex.com)

---

**Dica:** Use `Ctrl+F` para buscar rapidamente configurações específicas!
