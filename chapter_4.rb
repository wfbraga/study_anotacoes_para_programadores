# VARIAVEIS, ESCOPO E VISIBILIDAD

# 5.1 Variaveis de Classe

# Variaveis de classe tem um escopo amplo. Elas podem ser declaradas em qualquier lugar na classe.
# Uma vriavel sera' considerada de classe quando declarada com um prefixo @@
class Dinossaur
  @@classification = "Like a Repitale"

  def self.classification
    @@classification
  end

  def classification
    @@classification
  end
end

dino = Dinossaur.new

puts Dinossaur.classification

puts dino.classification

# Variavel de classe sao compartilhadas entre classes relacionadas com ela e podem ser sobrescritas por um variavel filha (child class)
class TRex < Dinossaur
  @@classification = "Big teeth bird!"
end

puts TRex.classification #=>"Big teeth bird!"

puts Dinossaur.classification #=>"Big teeth bird!"

# Esse comportamento e' indesejado na maioria das vezes e pode ser evitado usando variaveis de instancia de classe.

# Variaveis de classe declasadas dentro de um modulo nao sobrescreverao a variaveis de classe nas classes nas quais forem incluidas

module SomethingStrange
  @@classification = "Something Strange"
end

class DuckDinossaur < Dinossaur
include SomethingStrange
end

puts DuckDinossaur.class_variables #=> @@classification

puts SomethingStrange.class_variables #=> @@classification

puts DuckDinossaur.classification #=> Big teeth bird!

# 4.2 Variavies Locais

# Variaveis Locais, diferente de variaveis de classes, nao necesitam prefixo.

my_local_variable = 'Local'

p my_local_variable #=> 'Local'

# Seu escopo depende de onde foi declarada. Nao pode ser usada fora do escopo do "container de declaracao".
# Por exemplo, se a variavel local e declarada dentro de um metodo, so pode ser usada dentro dele.

def some_method
  method_scope_variable = "Hi there!"
  p method_scope_variable
end

some_method #=> "Hi there!"

# p method_scope_variable => undefined local variable or method `method_scope_variable' for main:Object (NameError)

# As varialves locais nao estao limitadas aos metodos. Seguindo a mesma regra, se declarada dentro de um bloco "do...end" ou contida dentro de {}
# seu escopo sera local para aquele bloco em que foi declarada

2.times do |i|
  local_var = i + 1
  p local_var
end

# p local_var #=> undefined local variable or method `method_scope_variable' for main:Object (NameError)

# No entanto, uma variavel local declarada dentro de um 'if' ou 'case' pode ser usada no escopo do seu parente superior mais proximo (parent-scope)
if true
  usable_outside = "yes!"
end

p usable_outside #=> "yes!"

# Embora uma variavel local nao possa se usada fora do seu bloco, ela pode ser usada "bloco adentro"

new_local = "foo"

new_local.split("").each_with_index do | char, i |
  p "The character in string #{new_local} ata index of #{i} is #{char}"
end
# "The character in string foo ata index of 0 is f"
# "The character in string foo ata index of 1 is o"
# "The character in string foo ata index of 2 is o"

# Mas apenas para blocos. Para metodos isso nao 'e possivel

def foo_method
  p "You can't use the local variavle in here, see? #{new_local}"
end

# foo_method #=> undefined local variable or method `new_local' for main:Object (NameError)

# Variaveis usadas como argumentos de blocos, sao, obviamente, locais para o bloco e vao sobrepujar variaveis de mesmo nome declaradas anteriormente, mas sem sobreescrevelas

["bar"].each do |new_local|
  p new_local #=> "bar"
end

p new_local #=> "foo"

# 4.3 Variaveis Globais

# Variaveis globais tem escopo globar e portanto, podem ser usadas em todo lugar. Seu escopo nao e' dependente de onde ela e' declarada.
# Uma variaver global deve ser definida usando $.

$i_am_global = 'omg'

class OtherDinossaur
  def instance_method
    p "Global vars can be used everywhere. See? #{$i_am_global}. #{$another_global_var}"
  end

  def self.class_method
    $another_global_var = "srsly?"
    p "Global vars can be used everywhere. See? #{$i_am_global}"
  end
end
  OtherDinossaur.class_method #=> "Global vars can be used everywhere. See? omg"

  other_dinossaur = OtherDinossaur.new
  other_dinossaur.instance_method #=> "Global vars can be used everywhere. See? omg. srsly?"

  # Devido ao fato de que uma variavel global pode ser chamada em qualquer lugar, chamar uma que nao foi definida retornada 'nil' ao invez de um erro.

  p $never_defined #=> 'nil'

  # De qualquier maneira, o uso de variaveis globais e' fortemente desencorajado e devemos preferir constantes.
# -------------------------------------------------------------------------------------------------------------

  # 4.4 Variaveis de Instancia

# Variaveis de instancia tem espoco dentro do objeto, podem ser declaradas em qualquer lugar dentro d mesmo, no entanto, uma variavel de instancia...
#... declarada no nivel da classe, somente sera visivel no objeto da classe. A variavel sera considerada de instancia quando tiver o prefixo @.
# Variaveis de instancias sao usadas para fazer get e set nos atributos do objeto e retornaram 'nil' caso sejam chamadas sem serem definidas.

class MyDinossaur
  @base_sound = 'rawrr'

  def initialize(sound = nil)
    @sound = sound || self.class.base_sound
  end
  
  def speak
    @sound
  end

  def try_to_speak
    @base_sound
  end

  def count_and_store_sound_length
    @sound.chars.each_with_index do |char, i|
      @sound_length = i + 1
      p "#{char}: #{sound_length}"
    end
  end

  def sound_length
    @sound_length
  end

  def self.base_sound
    @base_sound
  end
end

dino_1 = MyDinossaur.new
dino_2 = MyDinossaur.new "grrr"

p MyDinossaur.base_sound #=> "rawrr"

p dino_2.speak #=> 'grrr'

# Como mencionado, uma instancia em nivel de classe nao pode ser acessada no nivel do objeto
p dino_1.try_to_speak #=> 'nil'

# No entanto, nos usamos a variavel de instancia @base_sound para instanciar o sound quando nenhum sound e' pasado para o novo metodo.

p dino_1.speak #=> 'rawrr'

# Variaveis de instancia podem ser declaradas em qualquer lugar dentro de um objeto, mesmo dentro de um bloco
dino_1.count_and_store_sound_length
#"r: 1"
#"a: 2"
#"w: 3"
#"r: 4"
#"r: 5"

dino_1.sound_length #=> 5

# Variaveis de instancia nao compartilham seu valor entre instancias da mesma classe
dino_2.sound_length #=> nil

# Isso pode ser usado para criar variaveis de nivel de instancia que nao serao sobrescritas por uma classe filha, ja que classes tambem sao objetos em Ruby
class DuckDuckDino < MyDinossaur
  @base_sound = "quack, quack"
end
duck_dino = DuckDuckDino.new
p duck_dino.speak #=> 'quack, quack'

p DuckDuckDino.base_sound #=> "quack, quack"

p MyDinossaur.base_sound #=> "rwarr"