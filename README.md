# 🏭 Sistema de Monitoramento Industrial (SMI)

## 📝 Introdução e Contexto
Este projeto foi desenvolvido como parte de uma atividade prática de automação industrial. O objetivo é substituir o registro manual de dados por um sistema automatizado capaz de monitorar máquinas e sensores em tempo real, fornecendo um histórico estruturado e análises de qualidade automáticas.

## 🎯 Objetivo
O sistema resolve a falta de padronização e a ausência de histórico em ambientes industriais, permitindo:

- Cadastro de ativos (máquinas, sensores e operadores).
- Registro automatizado de leituras de temperatura.
- Classificação de risco instantânea (Normal, Alerta, Crítico).
- Armazenamento híbrido em Banco de Dados Relacional e JSON.

## 🗄️ Estrutura do Banco de Dados (MySQL)
O banco de dados foi projetado seguindo o modelo relacional para garantir que nenhuma leitura de sensor fique órfã e que todo alerta esteja vinculado a um evento real.

Dicionário de Tabelas:
- `maquinas`: Equipamentos monitorados.
- `sensores`: Dispositivos vinculados às máquinas via `id_maquina`.
- `operadores`: Registro de pessoal e seus respectivos turnos.
- `leituras`: Armazena os valores `FLOAT` e o momento exato da captura.
- `alertas`: Gerada automaticamente quando uma `leitura` atinge níveis críticos.
- `manutencoes`: Tabela de relacionamento que vincula `maquinas` e `operadores` para registro de intervenções.

## 🌡️ Regras de Análise
O sistema classifica a temperatura automaticamente:

- Até **70°C**: NORMAL
- **71°C** a **90°C**: ALERTA
- Acima de **90°C**: CRÍTICO

## 🔄 Fluxo do Sistema
Seguindo o Pensamento Sistêmico:
1. **Entrada:** Dados digitados pelo usuário no menu Python.
2. **Processamento:** O Python valida as opções e organiza as consultas SQL.
3. **Armazenamento:** Os dados são enviados e salvos permanentemente no MySQL.
4 **Saída:** Relatórios exibidos no terminal e feedbacks de sucesso/erro.

## 🐍 Funcionamento do Código (Python)
O sistema foi desenvolvido em Python utilizando um menu interativo que se comunica diretamente com o banco de dados MySQL.
**Principais Funções:**

- **Conexão:** O script estabelece ligação com o banco de dados `bancoPGJ` via `mysql.connector.`
- **Menu Interativo:** Um laço de repetição (`while True`) mantém o sistema rodando até que o usuário escolha a opção "0".
- **Cadastros (Opções 1, 2 e 3)**: Coleta dados do usuário e utiliza comandos `INSERT` para salvar máquinas, sensores e operadores no banco.
- **Registro de Dados (Opção 4)**: Registra o valor lido pelo sensor e utiliza a função `CURDATE()` do SQL para salvar a data automaticamente.
- **Consultas (Opção 5)**: Utiliza o comando `SELECT` e o método `fetchall()` para listar todas as informações salvas nas tabelas.
- **Análise de Qualidade (Opção 6)**: Uma lógica condicional (`if`/`elif`/`else`) verifica a temperatura digitada e classifica o status da operação em tempo real.

**Exemplo de Lógica de Análise:**
```python
if temperatura < 70:
    print("NORMAL")
elif temperatura >= 71 and temperatura <= 90:
    print("ALERTA")
else:
    print("CRÍTICO")
```

## 📁 Armazenamento em JSON (em breve)
Além do banco de dados, o sistema salvará um arquivo `.json` como backup ou log de auditoria.
Exemplo de estrutura esperada:
```JSON
{
  "id_leitura": 101,
  "sensor": "Termopar-01",
  "valor": 85.5,
  "unidade": "°C",
  "status": "ALERTA",
  "timestamp": "2024-05-20 14:30:00"
}
```

## 📂 Estrutura do Projeto

```Plaintext
/Projeto-Automacao
│── /codigo          # Scripts Python
│── /banco           # Script SQL (.sql)
│── /dados_json      # Arquivos JSON gerados
└── README.md        # Documentação
```

## 🚀 Como Rodar o Projeto

1. Certifique-se de ter o MySQL instalado e o banco criado com o script da pasta `banco`.
2. Instale a biblioteca necessária: `pip install mysql-connector-python`.
3. Execute o arquivo principal: `python main.py`.

## 🛠️ Tecnologias
- Linguagem: Python
- Banco de Dados: MySQL Workbench 8.0

## 👥 Autores
- [Lazy](https://github.com/Pedrobarbancho)
- [Gilberto Alves](https://github.com/GIBINHA99)
- [Julia Lopes](https://github.com/julialsilva27-rgb)
