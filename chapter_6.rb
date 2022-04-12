# Capitulo 6: Constantes

# 6.1 Definindo Contantes

MY_CONSTANT = "Hello, world!" # e' uma constante
Constant = 'This is also constant' # Tambem e' uma constante
my_varable = 'Hello, moon' # nao e' constante

# O nome de uma constante deve comecar com maiuscula. Tudo que comeca com letra maiuscula e' considerado uma constante en Ruby.
# Dessa forma, 'class' e 'module' tambem sao constantes. E' considerado melhor pratica declarar constantes totalmente em maiuscula.

# 6.2 Modificando uma constante

MY_NEW_CONST = 'Hello, world' 
MY_NEW_CONST = 'Hello, moon' #=> 15: warning: already initialized constant MY_NEW_CONST
                             #=> 14: warning: previous definition of MY_NEW_CONST was here
p MY_NEW_CONST #=> 'Hello, moon'

# O codigo acima resulta em um alerta mas nao impede que o codigo seja executado. O aviso se deve ao fato de que, se voce quer alterar um valor, deveria usar variaveis.
# Entretanto, pose-se mudar uma letra por vez em uma constante sem disparar um aviso da seguinte maneira:

MY_NEW_CONST[1] = 'i'
p MY_NEW_CONST #=> 'Hillo, moon'

# 6.3 Constantes nao podem ser definidas dentro de metodos
def say_hi
  MESSAGE = 'Hi!'
  p MESSAGE
end
# Sem sequer precisar chamar a funcao o codigo quebra e temos a mensagem:
# dynamic constant assignment
#  MESSAGE = 'Hi!'

# 6.4 Definindo e mudando constantes em uma classe
class Message
  DEFAULT_MESSAGE = 'Hi!'

  def speack(message = nil)
    if messge
      p message
    else
      p DEFAULT_MESSAGE
    end
  end
end

# A constante DEFAULT_MESSAGE pode ser alterada da seguinte maneira:
Message::DEFAULT_MESSAGE = 'Hello!'

p Messase.DEFAULT_MESSAGE