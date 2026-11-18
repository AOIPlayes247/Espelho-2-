# StarControl

Controle o Windows pelo celular (WebRTC + PeerJS), 100% pela web.

## Estrutura do repositório
```
index.html        site completo (HTML, CSS e JS)
manifest.json     Web App (instalar no celular)
sw.js             service worker (cache)
assets/           logo, favicon e ícones do app
```

## Publicar no GitHub Pages
1. Envie TODOS os arquivos e a pasta `assets/` para a raiz do repositório (mantenha a pasta assets).
2. Settings -> Pages -> Source: Deploy from a branch -> Branch: main, pasta / (root) -> Save.
3. Abra https://SEU-USUARIO.github.io/NOME-DO-REPO/ (leva cerca de 1 minuto).

## Usar
- PC: no site, clique em "Baixar Launcher para PC" (gera agent.py + INICIAR-PC.bat). Deixe na mesma pasta, instale o Python (marque "Add Python to PATH") e dê dois cliques no INICIAR-PC.bat. O painel abre em http://localhost:8766.
- No painel do PC: escolha a qualidade, anote o código e clique em "Iniciar Transmissão de Tela".
- Celular: abra o site (ou escaneie o QR), conecte com o código e toque em "Instalar Web App no Celular" se quiser o atalho. No PC, clique OK em "Permitir que um dispositivo controle este PC?".

## Controles do celular
- Aba "Tela ao Vivo": botões estilo PojavLauncher sobre a tela. "✏️ Controles" edita (arrastar, tocar para editar tecla/combo de até 4 teclas, modo segurar/alternar, tamanho, transparência), exporta e importa layouts .json.
- Aba "Mouse": escolha entre mouse flutuante (botões esquerdo/direito e bolinha de rolagem), arrastar e tocar, ou trackpad.

## Somente rede local
- O WebRTC é configurado sem servidores STUN/TURN: só candidatos da rede local são usados, então um aparelho em outra internet não consegue abrir a conexão.
- Além disso, o PC confere o endereço do aparelho e recusa qualquer um que não seja da rede local (IP privado/link-local ou .local).
- Cada pessoa usa o site com o próprio PC, na própria rede. O pareamento (troca do código) ainda usa o servidor público do PeerJS, então PC e celular precisam de internet nesse momento.
- Não funciona com VPN, redes com isolamento de clientes (Wi-Fi de visitantes) ou redes que bloqueiam mDNS.

## Menu do celular
- Botão ☰ no canto superior direito: Joystick, Som, modo do mouse, Teclado, Controles, Mouse (sensibilidade), Apps e atalhos, Configurações (FPS, ping, CPU, GPU, buffer, Mbps no canto superior esquerdo) e Créditos.
- Criado por AOIofc1 — https://www.youtube.com/@AOIofc1

## StarMonitor (segundo monitor)
- O card "StarMonitor" baixa `downloads/StarMonitor.zip` (projeto separado: celular como segundo monitor na rede local). Envie a pasta `downloads/` junto com o site.

## Segundo monitor integrado
- Instale o Virtual Display Driver, estenda a tela para o monitor virtual e clique em "Iniciar Transmissão de Tela" escolhendo a Tela inteira desse monitor.
- O agente lista os monitores e o painel escolhe sozinho o "Monitor controlado" (pela proporção da tela). Se houver ambiguidade, escolha na lista.
- O toque do celular passa a mover o mouse só nesse monitor.

## App instalável no Windows
- `downloads/StarControl-Instalador-Kit.zip`: kit para criar `StarControl-PC.exe` (PyInstaller) e o instalador `StarControl-Setup.exe` (Inno Setup). Veja o LEIA-ME.txt dentro do kit.
