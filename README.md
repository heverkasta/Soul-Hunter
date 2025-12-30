# Soul Hunter

## Identificação do Projeto

- **Nome do Projeto:** Soul Hunter
  - **Porque este nome:** Este nome busca ser claro e objetivo com a proposta do jogo, onde o jogador terá como meta caçar as almas dos monstros que ameaçam a ilha em que o jogo se passa.
- **Membros:**
  - [Carlos Daniel Silva](https://github.com/CarlosDaniel-Droid) (Back-end e Game-Dev).
  - [Heverton Renee Alves Silva](https://github.com/heverkasta) (Game-Dev).
  - [João Geraldo Santos Xavier](https://github.com/JoaoGeraldoS) (Front-end e Back-end).
  - [Phelipe Gabriel Santos da Silva](https://github.com/niltz-dev) (Designer).
  
## Apresentação do Projeto

O projeto Soul Hunter consiste em um jogo JvA (jogador versus ambiente) com mecânicas simples de práticas com dois modos de jogo.
O primeiro é um modo história, onde o jogador avançará por fases, derrotando inimigos e desbloqueando partes da história.
O segundo modo tem como objetivo derrotar e sobreviver a hordas infinitas de inimigos, buscando conseguir a maior pontuação possível do ranking.
A versão web do projeto possibilitará aos usuários jogarem o Soul Hunter na web, sem a necessidade de instalar, além de conter um chat em tempo real para que os jogadores conversem entre si e uma tabela de ranking para o modo de hordas infinitas.

## Stack Tecnológica

- **Front-end Web:**
  - Linguagens: HTML, CSS e JavaScript.
  - Justificativa: Simples, prático e funcional.

- **Versão Mobile (Nativo):**
  - Linguagem: GDScript (linguagem própria do motor gráfico [Godot Engine](https://godotengine.org), no qual o projeto será desenvolvido).
  - Justificativa: O [Godot Engine](https://godotengine.org) é um motor gráfico de código aberto com diversas ferramentas que facilitam o desenvolvimento de jogos, principalmente mobile.

- **Back-end:**
  - Linguagem: Go.
  - Banco de Dados: [Firebase](https://firebase.google.com/).
  - Justificativa:
    - Go: Afinidade com a linguagem, além de ser rápida e eficaz.
    - Firebase: Banco de dados NOSQL é mais adequado para lidar com os dados dos jogadores.

## Mapa de Telas
### Web
- **Tela 1:** Página Inicial.
  - **Objetivo:** Apresentar o projeto ao usuário.
  - **Elementos:**
    - Apresentação do jogo.
    - Botão "Jogar Agora!".
  - **Ações:**
    - Clicar "Jogar Agora!" → Redireciona para a página do jogo.
  <br>  
- **Tela 2:** Página Interativa.
  - **Objetivo:** Jogar e baixar o jogo e conversar com os outros jogadores.
  - **Elementos:**
    - Jogo na versão web.
    - Botão "Baixe agora".
    - Chat geral.
    - Botão "Ver Ranking".
  - **Ações:**
    - Jogar o jogo na versão web.
    - Clicar "Baixe agora" → Baixa o APK do jogo para dispositivos Android (não disponível para dispositivos IOS).
    - Conversar no chat geral.
    - Clicar "Ver Ranking" → Redireciona para a página do ranking.
  <br>  
- **Tela 3:** Página do Ranking.
  - **Objetivo:** Mostrar a tabela de ranking do modo de hordas infinitas.
  - **Elementos:**
    - Tabela de ranking.
  - **Ações:**
    - Ver tabela de ranking.

  <br>  

### Aplicativo
- **Tela 1:** Tela Inicial.
  - **Objetivo:** Dar início ao jogo.
  - **Elementos:**
    - Título do jogo.
    - Botão "Jogar Demo".
    - Botão "Arcade".
  - **Ações:**
    - Clicar "Jogar Demo" → Redireciona para a tela de seleção de personagem.
    - Clicar "Arcade" → Redireciona para a tela de seleção de personagem.
   
  <br>  
  
- **Tela 2:** Tela de Seleção de Personagem.
  - **Objetivo:** Escolher Personagens.
  - **Elementos:**
    - Botões para cada personagem jogável
    - Botão "Começar"
  - **Ações:**
    - Clicar no personagem desejado → Seleciona o personagem desejado.
    - Clicar "Começar" → Redireciona para o jogo.   
   
  <br>  
  
- **Tela 3:** Tela do Jogo.
  - **Objetivo:** Jogar.
  - **Elementos:**
    - Analógicos direcionais para controlar o movimento e ataques do personagem.
    - Barras de vida, de energia e de almas.
    - Botão de pausar o jogo
  - **Ações:**
    - Controlar o personagem.
    - Pausar jogo
   
  <br>  

## Fluxograma de Navegação
### Web
Página Inicial → Página Interativa → Página de Ranking.
### Aplicativo
Tela Inicial → Tela de Seleção de Personagem → Tela do Jogo.

## Funcionalidades
- **ESSENCIAIS:**
  - Demonstração do modo história.
  - Modo Arcade (hordas infinitas).

- **IMPORTANTES:**
  - Chat da comunidade.
  - Tabela de ranking.

- **DESEJÁVEIS:**
  - Salvamento do progresso dos jogadores no servidor.

## Assets
- **Depósitos de Almas:**

![estatuaA](https://github.com/heverkasta/Soul-Hunter/blob/main/exemplos/estatuaA.png?raw=true)    ![estatuaB](https://github.com/heverkasta/Soul-Hunter/blob/main/exemplos/estatuaB.png?raw=true)

- **Interface:**

![Interface](https://github.com/heverkasta/Soul-Hunter/blob/main/exemplos/interface.png?raw=true)

- **Arqueira:**

![Arqueira](https://github.com/heverkasta/Soul-Hunter/blob/main/exemplos/archer.png?raw=true)

- **Slimes:**

![Slimes](https://github.com/heverkasta/Soul-Hunter/blob/main/exemplos/slimes.png?raw=true)

- **Terreno:**

![terreno](https://github.com/heverkasta/Soul-Hunter/blob/main/exemplos/terreno.png?raw=true)

## Banco de dados
1)Para o banco de dados do jogo, será utilizado o Firebase, que é um banco de dados NOSQL, ou seja, que não se utiliza das tradicionais tabelas e SQL, mas sim documentos e cada documento pode conter um ou mais dados. Nesse banco será armazenado dois tipos de dados:
<br>
-"Usuário", do tipo string
<br>
-"Pontos", do tipo int
<br>
-Sendo assim, cada jogador no banco de dados é um documento próprio, contendo seu nome e pontuação.

2)-O jogo irá se conectar ao banco através da API, que receberá os dados necessários que serão enviados pelo jogo em formato JSON, através de requisições HTTP, pelo endpoint "/api/dados", valida-los e envia-los para o banco.<br>
E o site irá se conectar ao mesmo banco, para buscar as informações necesárias e mostrar no site. "Pontos" serve para o ranking do modo arcade e "Usuários" para o mesmo propósito, mas também sendo usado na parte de perfil e jogo.
<br>

3)Abaixo um exemplo de envio e leitura dos dados:<br>
-Envio dos dados-
``` json
{
  "usuario":Znafo,
  "pontos":1000
}
```
<br>

-Leitura(response)-
``` json
{
  "status": "Dados enviados!",
  "firebase_response": {
    "name": "projects/soul-hunter-eaf66/databases/(default)/documents/Ordem/Znafo",
    "fields": {
      "pontos": {
        "integerValue": "380"
      },
      "usuario": {
        "stringValue": "Znafo"
      }
    },
    "createTime": "2025-12-29T17:04:10.547751Z",
    "updateTime": "2025-12-29T17:04:10.547751Z"
  }
}
```
Dessa forma, o jogo e o site interagem com o banco de dados de maneira indireta e segura, utilizando a API como intermediária para envio e leitura das informações armazenadas no Firebase Firestore.

<br>

### Cronograma de Desenvolvimento
| Período | Atividade | Responsável |
|---------|-----------|-------------|
| 03/12 - 16/12 | Desenvolvimento telas Web | Front-end |
| 03/12 - 14/12 | Configuração do Banco de Dados | Back-end |
| 17/12 - 15/01 | Desenvolvimento da API | Back-end |
| 03/12 - 25/01 | Desenvolvimento dos Assets | Designer |
| 03/12 - 01/02 | Desenvolvimento do Jogo | Game-Dev |
