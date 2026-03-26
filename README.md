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
1. Entrada: O sensor envia a temperatura (simulação).
2. Processamento: O Python verifica se a temperatura está em nível de alerta.
3. Armazenamento: Os dados são salvos no MySQL e um backup é gerado em JSON.
4. Saída: O histórico é exibido no console para o usuário.

## 🐍 Desenvolvimento do Sistema (Python & JSON)
> **Nota:** O sistema encontra-se em fase de desenvolvimento. A estrutura do banco de dados (MySQL) já está totalmente funcional, e a lógica de integração em Python está sendo implementada.

## 💻 Lógica de Programação (Em breve)
O código Python será responsável por:

- **Conexão:** Utilizar a biblioteca mysql-connector-python para enviar dados ao banco.
- **Simulação:** Gerar valores aleatórios de temperatura para os sensores.
- **Classificação:** Usar estruturas condicionais (`if`/`elif`/`else`) para definir o nível de risco (Normal, Alerta ou Crítico).

## 📁 Armazenamento em JSON
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
│── /documentacao    # Prints do sistema e do banco
└── README.md        # Documentação
```

## 🛠️ Tecnologias
- Linguagem: Python
- Banco de Dados: MySQL Workbench 8.0

## 👥 Authors
- [Lazy](https://github.com/Pedrobarbancho)
- [Gilberto Alves](https://github.com/GIBINHA99)
- [Julia Lopes](https://github.com/julialsilva27-rgb)
