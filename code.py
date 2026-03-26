import mysql.connector
from mysql.connector import Error

conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="bancoPGJ",
    port=3306
)

cursor = conexao.cursor()

while True:
    print("\n--- SISTEMA INDUSTRIAL ---")
    print("1 - Cadastrar máquina")
    print("2 - Cadastrar sensor")
    print("3 - Cadastrar operador")
    print("4 - Registrar leitura")
    print("5 - Consultar dados")
    print("6 - Análise de qualidade")
    print("0 - Sair")

    opcao = input("Escolha: ")

    if opcao == "1":
        try:
            nome = input(str("Nome da máquina: "))
            print("Status da máquina")
            if input("A máquina está ativa? (s/n): ").lower() == 's':
                status = "Operacional"
            elif input("A máquina está inativa? (s/n): ").lower() == 'n':
                status = "Inoperante"
            else:
                print("Entrada inválida para status. Definindo como 'Desconecido'.")
                status = "Desconecido"

            sql = "INSERT INTO maquinas (nome_maquina, status_maquina, data_instalacao) VALUES (%s, %s, CURDATE())"
            cursor.execute(sql, [nome, status])
            conexao.commit()
        except Error as e:
            print("Erro ao cadastrar máquina:", e)

    elif opcao == "2":
        try:
            tipo = input(str("Tipo do sensor: "))
            modelo = input(str("modelo do sensor: "))
            id_maquina = input(str("ID da máquina associada: "))

            sql = "INSERT INTO sensores (tipo_sensor, modelo, id_maquina) VALUES (%s, %s, %s)"
            cursor.execute(sql, [tipo, modelo, id_maquina])
            conexao.commit()
        except Error as e:
            print("Erro ao cadastrar sensor:", e)

    elif opcao == "3":
        try:
            nome = input(str("Nome do operador: "))
            turno = input(str("Turno do operador: "))

            sql = "INSERT INTO operadores (nome, turno) VALUES (%s, %s)"
            cursor.execute(sql, [nome, turno])
            conexao.commit()
        except Error as e:
            print("Erro ao cadastrar operador:", e)
    elif opcao == "4":
        try:
            id_sensor = input(str("ID do sensor: "))
            valor_leitura = input(float("Valor da leitura: "))

            sql = "INSERT INTO leituras (id_sensor, valor, data_leitura) VALUES (%s, %s, CURDATE())"
            cursor.execute(sql, [id_sensor, valor_leitura])
            conexao.commit()
        except Error as e:
            print("Erro ao registrar leitura:", e)
    elif opcao == "5":
        escolha_consulta = input("Escolha a consulta: \n1 - Máquinas \n2 - Sensores \n3 - Operadores\n ")
        if escolha_consulta == "1":
            cursor.execute("SELECT * FROM maquinas")
            for linha in cursor.fetchall():
                print(linha)
        elif escolha_consulta == "2":
            cursor.execute("SELECT * FROM sensores")
            for linha in cursor.fetchall():
                print(linha)
        elif escolha_consulta == "3":
            cursor.execute("SELECT * FROM operadores")
            for linha in cursor.fetchall():
                print(linha)
    elif opcao == "6":
        temperatura = input(float("Digite a temperatura para análise: "))
        if temperatura < 70:
            print("NORMAL")
        elif temperatura >= 71 and temperatura <= 90:
            print("ALERTA")
        else:
            print("CRÍTICO")
    elif opcao == "0":
        print("Saindo...")
        break
    else:
        print("Opção inválida!")

cursor.close()
conexao.close() 
