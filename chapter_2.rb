puts "Casting (type conversion)"

=begin 
def cast_to_float(value)
  value.to_f
end

my_float = cast_to_float("123.5")

puts my_float + 2

def cast_to_string(value)
  value.to_s
end

my_float = cast_to_string(my_float)

puts Float(my_float) + 2

puts String(my_float) + " agora uma string"

# CAST to Integer

puts my_float.to_i # 123 


# tambien puedes usar
Integer("123.40") #=> 123
# Para converter uma strin to_i vai pegar o valor do inicio dela mas nao de qualquier outro lugar
"123.50-foo".to_i #=> 123
"foo-123.50".to_i #=> 0

=end

# Integer() e Float() no caso de uma string invalida retornarao umerro.
# .to_f e to_i retornarao 0

# Section 2.4: Floats and Integers

puts 5/3 #=> 1 isso acontece porque estamos dividindo 2 numeros inteiros. Para resover, precisamos fazer casting de pelo menos um deles para float

puts 5.to_f / 3 #=> 1.6666

puts 5 / Float(3) #=> 1.6666

# Uma alternativa: usar fdiv para retornar o float resultante da divisao mas sem fazer a conversao explicita de nenhum deles

puts 5.fdiv 3 #=> 1.6666