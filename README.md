# wired-desktop

> *"present day, present time · the wired is open"*

Ambiente desktop cyberpunk minimalista inspirado na estética de **Serial Experiments Lain**, terminal fósforo verde e computação local-first. Construído sobre **Debian + LXDE + Openbox**, especialmente otimizado para hardware leve (Intel Atom, netbooks, mini PCs e SBCs) sem abrir mão de elegância e ergonomia.

---

## 👁️ Visão Geral

O **wired-desktop** transforma uma instalação básica do Debian/LXDE em uma estação de trabalho temática, fluida e com baixo consumo de memória (~150 MB a 250 MB de RAM em repouso).

### Paleta de Cores
- **Fundo Base:** `#070b09` (Preto profundo / verde abissal)
- **Fósforo Primário:** `#9dffb0` (Verde terminal clássico)
- **Destaque Secundário:** `#6fd3c8` (Ciano suave)
- **Bordas e Superfícies:** `#143028` / `#1f4d38` (Verde escuro de alto contraste)
- **Texto Principal:** `#c8f5d4` (Leitura confortável)

---

## 📦 Estrutura do Repositório

```text
wired-desktop/
├── bin/                          # Utilitários e wrappers
│   ├── wired-about               # Janela nativa GTK3 "Sobre o Sistema"
│   ├── wired-audio               # Reprodução de efeitos sonoros com timeout
│   ├── wired-launch              # Wrapper de execução com feedback de áudio
│   └── wired-terminal            # Emulador de terminal otimizado
├── config/                       # Arquivos de configuração do usuário
│   ├── openbox/                  # Menus e atalhos de janela (lxde-rc.xml, menu.xml)
│   ├── lxpanel/                  # Barra de tarefas e plugins (panel)
│   ├── lxsession/                # Sessão de usuário e variáveis (desktop.conf)
│   ├── pcmanfm/                  # Gerenciador de arquivos e área de trabalho
│   ├── gtk-3.0/ & gtk-4.0/       # Temas escuros, bordas e estilos GTK
│   ├── menus/                    # Organização hierárquica do menu principal
│   ├── applications/             # Atalhos .desktop customizados
│   └── bashrc-wired.sh           # Prompt de terminal em verde fósforo
├── icons/                        # Tema de ícones Phosphor wired (16px, 22px, 48px)
├── sounds/                       # Efeitos sonoros temáticos (boot, ação, terminal)
├── system/                       # Componentes em nível de sistema operacional
│   ├── grub/                     # Tema de boot GRUB minimalista
│   ├── plymouth/                 # Animação de inicialização do kernel
│   ├── scripts/                  # Script do diálogo de logout (/usr/bin/lxde-logout)
│   └── os-release/               # Identidade visual /etc/os-release (wired OS)
├── themes/                       # Tema de janelas Openbox (wired)
├── wallpapers/                   # Papel de parede oficial (wired.png)
└── install.sh                    # Script de instalação automatizada
```

---

## 🚀 Instalação Rápida

### 1. Clonar o repositório
```bash
git clone https://github.com/dougdotcon/wired-desktop.git
cd wired-desktop
```

### 2. Instalar configurações de usuário
```bash
./install.sh
```

### 3. Instalar componentes do sistema (Opcional - Requer sudo)
Aplica o tema de boot do GRUB, a animação do Plymouth, o diálogo de logout do sistema e a identificação do SO em `/etc/os-release`:
```bash
./install.sh --system
```

---

## ⚙️ Principais Funcionalidades

- **Menu de Contexto e Sobre o Sistema:** Clique com o botão direito na barra de tarefas ou na área de trabalho e acesse o aplicativo **Sobre o Sistema** para inspecionar hardware, kernel e consumo em tempo real.
- **Áudio Imersivo:** Sons sutis de inicialização e ações de sistema controlados pelo `wired-audio` via PulseAudio/PipeWire.
- **Diálogo de Desconexão:** Tela de encerramento padronizada com banner temático em alta resolução e botões funcionais para desligar, reiniciar ou suspender.
- **Eficiência de Recursos:** Sem efeitos pesados de composição de janelas; máxima velocidade de resposta em processadores x86_64 e ARM de baixo TDP.

---

## 📄 Licença

Distribuído sob a licença MIT. Criado por [Douglas H. M. Fulber (dougdotcon)](https://github.com/dougdotcon).
