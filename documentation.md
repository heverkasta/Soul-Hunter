# Soul Hunter

## Identificação do Projeto

- **Nome do Projeto:** Soul Hunter
  - **Porque este nome:** Este nome busca ser claro e objetivo com a proposta do jogo, onde o jogador terá como meta caçar as almas dos monstros que ameaçam a ilha em que o jogo se passa.
- **Membros:**
  - [Carlos Daniel Silva](https://github.com/CarlosDaniel-Droid)
  - [Heverton Renee Alves Silva](https://github.com/heverkasta)
  - [João Geraldo Santos Xavier](https://github.com/JoaoGeraldoS)
  - [Phelipe Gabriel Santos da Silva](https://github.com/niltz-dev)
  
## Apresentação do Projeto

O projeto Soul Hunter consiste em um jogo JvA (jogador versus ambiente) com mecanicas simples de práticas com dois modos de jogo.
O primeiro é um modo história, onde o jogador avançará por fazes, derrotando inimigos e desbloqeando partes da história.
O segundo modo tem como objetivo derrotar e sobreviver a hordas infinitas de inimigos, buscando conseguir a maior pontuação possível do ranking.
A versão web do projeto possibilitará aos usuários jogarem o Soul Hunter na web, sem a necesidade de instalar, além de conter um chat em tempo real para que os jogadores conversem entre si e uma tabela de ranking para o modo de hordas infinitas.

## Stack Tecnológica

- **Front-end Web:**
  - Linguagens: HTML, CSS e JavaScript.
  - Justificativa: Simples, prático e funcional.

- **Versão Mobile (Nativo):**
  - Linguagem: GDScript (linguagem propria do motor grafico [Godot Engine](https://godotengine.org), no qual o projeto será desenvolvido).
  - Justificativa: O [Godot Engine](https://godotengine.org) é um motor grafico de código aberto com diversas ferramentas que facilitam o desenvolvimento de jogos, principalmente mobile.

- **Back-end:**
  - Linguagem: Go.
  - Banco de Dados: Firebase.
  - Justificativa:
    - Go: Afinidade com a linguagem, alem de ser rápida e eficaz.
    - Firebase: Banco de dados NOSQL é mais adequado para lidar com os dados dos jogadores.

## Mapa de Telas
### Web
- **Tela 1:** Pagina Inicial.
  - **Objetivo:** Apresentar o projeto ao usuário.
  - **Elementos:**
    - Apresentação do jogo.
    - Botão "Jogar Agora!".
  - **Ações:**
    - Clicar "Jogar Agora!" → Redireciona para a pagina do jogo.
   
- **Tela 2:** Pagina Interativa.
  - **Objetivo:** Jogar e baixar o jogo e conversar com os outros jogadores.
  - **Elementos:**
    - Jogo na versão web.
    - Botão "Baixe agora".
    - Chat geral.
    - Botão "Ver Ranking".
  - **Ações:**
    - Jogar o jogo na versão web.
    - Clicar "Baixe agora" → Baixa o APK do jogo para dispositivos Android (não disponivel para dispositivos IOS).
    - Conversar no chat geral.
    - Clicar "Ver Ranking" → Redireciona para a pagina do ranking.

- **Tela 3:** Pagina do Ranking.
  - **Objetivo:** Mostrar a tabela de ranking do modo de hordas infinitas.
  - **Elementos:**
    - Tabela de ranking.
  - **Ações:**
    - Ver tabela de ranking.

### Aplicativo
