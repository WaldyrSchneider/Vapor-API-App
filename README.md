# Aplicativo usando SwiftUI e Consumo da API

Este é um projeto que demonstra o desenvolvimento de um aplicativo iOS para consumir uma API feita em Vapor. O aplicativo utiliza o padrão de arquitetura MVVM (Model-View-ViewModel) e também faz uso do padrão Singleton.

## Recursos

- Utilização do framework SwiftUI para criar a interface do usuário.
- Arquitetura MVVM para separação clara de responsabilidades.
- Implementação de padrão Singleton.
- Consumo de dados da API desenvolvida com o framework Vapor e banco de dados PostgreSQL.
  
## Tecnologias

- Swift
- SwiftUI
- MVVM
- Singleton

## Estrutura do Projeto

- **Model**: Contém as estruturas de dados que representam as informações do aplicativo.
- **ViewModel**: Inclui os ViewModels que atuam como intermediários entre os Model e as Views.
- **View**: Contém as Views definidas usando o SwiftUI.
- **Utilities**: Inclui utilitários e lógica para fazer requisições à API e receber os dados.
