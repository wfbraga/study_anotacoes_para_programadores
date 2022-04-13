#!/usr/bin/env ruby

# INICIANCO EM RUBY

# 1.1: Hello World
# Este exemplo assume que voce ja tem o ruby instalado

# Para que o resultado de uma função ou o valor contido em uma variável seja “impresso” no terminal usamos o comando “puts” ou sua abreviação “p” 

puts "Hello, wordl!" #=> "Hello, wordl!"

p "Hi, I am the world!" #=> "Hi, I am the world!"

# A saída (output) será mostrada imediatamente no console. Códigos fontes em Ruby não precisam se compilados antes de ser executado.
# O interpretador compila e executa o Ruby no momento em que você o executa (at runtime) 
#----------------------------------------------------------------

# 1.2 Nosso “Hello, world!” como um arquivo executável usando Shebang (apenas para SO baseados em Unix)

# Como você pode notar inserimos o comentário “#!/usr/bin/env ruby” no início do nosso arquivo 
#Agora precisamos dar permissao para que ele seja executado. Assim e’ como se faz no Unix: digite no seu terminal 

# chmod u+x chapter_1.rb 

 #Agora você não precisa mais chamar o Ruby explicitamente e apenas digitar no terminal... 

#./chapter_1.rb 
#----------------------------------------------------------------

# 1.3 Hello World usando IRB

# Uma alternativa para executar comando Ruby e’ usar Interactive RUby Shell (IRB) para imediatamente executar declarações Ruby.
# Digite no terminal “irb”.  Uma linha com o número da versão do Ruby aparece com o separado “>”.
# Digite “puts ‘Hello, wordl!’” ou “print ‘Hello, world!’” se não quiser uma nova linha. Veja o resultado. 
#----------------------------------------------------------------

# 1.4 Hello, world! Sem Código  Fonte

# Você pode executar seu código Ruby sem ter um arquivo executável usando o comando abaixo no terminal
# ruby -e 'print "Hello, world!"'

# Você também pode alimentar um programa em Ruby usando a entrada primaria do programa.
# Uma forma e’ usar um “here document” (saiba mais em https://en.wikipedia.org/wiki/Here_document) digitando no seu terminal da seguinte forma: 
  
# ruby <<END 
# Puts “Hello, world!” 
# END 

# Se você não tem um “here document” configurado a saída será no terminal. 
#----------------------------------------------------------------

# 1.5 Hello, world! Usando tk

# Por ser necessário instalar uma biblioteca a parte, não cobriremos esse tópico nessa tradução porquê e’ necessário instalar a biblioteca, mas deixo aqui a informação de que com Tk você pode criar GUIs (Graphical User Interfaces) para seu programa em Ruby. 
#----------------------------------------------------------------

# 1.6 Meu Primeiro Metodo

# Em muitas linguagens há uma similaridade muito grande entre funções e métodos, mas costumamos chamar funções aquilo que tem um escopo independente de classes e objetos.
# NorChamamos de métodos aquilo que esta’ declarado dentro de uma classe. 
# Em Ruby não há distinção e chamamos tudo de método.

# Veja o código abaixo. Vamos tranformar nosso comando “puts” em um metodo para imprimir “Hello, world!” 
def say_hello
  puts "Hello, world!"
end
# Agora que fizemos isso, e’ hora de "chamar” nosso metodo.
say_hello() #=> "Hello, world!"

# Uma vez que esse metodo nao precisa de argumentos, podemos chama-la sem o uso de parenteses
say_hello #=> "Hello, world!"

# A palavra “def” significa que estamos def-inindo um método e a palavra “end” indica o fim do mesmo.  
#-------------------------------