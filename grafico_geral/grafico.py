import glob

# Especifica o diretório onde estão os arquivos .tr
diretorio = '/mnt/c/Users/felip/Documents/UFRPE/Redes/SEMFIO/grafico_geral'

# Define o padrão para buscar arquivos .tr
padrao = diretorio + '/*.tr'

# Lista todos os arquivos .tr no diretório
arquivos = glob.glob(padrao)

# Cria um arquivo para salvar as informações
arquivo_saida = 'saida_geral.txt'
saida = open(arquivo_saida, 'w')

# Loop pelos arquivos .tr
for arquivo in arquivos:
    # Abre o arquivo atual
    with open(arquivo, 'r') as f:
        # Conta as linhas que começam com 'r'
        contador_r = 0
        contador_s    = 0
        for linha in f:
            if linha.startswith('r'):
                contador_r += 1
            elif linha.startswith('s'):
                contador_s += 1
        # Salva as informações no arquivo de saída
        saida.write('{}: R={} S={} %PDR={}\n'.format(arquivo, contador_r , contador_s, (contador_r /(contador_r +contador_s))*100))

# Fecha o arquivo de saída
saida.close()