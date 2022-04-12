# Capitulo 5: Variaveis de Ambiente

# 5.1 Exemplo para pegar o caminho para o diretorio do usuario

# retornara o caminho do do diretorio do usuario
p ENV['HOME'] #=> /User/username

# Tentara recuperar a variavel 'FOO'. Se falhar, tentara pegar a 'bar'
p ENV.fetch('FOO', 'bar')

# p ENV['PATH']

p ENV['RUBYPATH']