class Post
  def initialize(titulo)
    @titulo = titulo
  end

  def publish
    puts "Post #{@titulo} fue publicado"
  end
end

class Comentario
  def initialize(titulo, comentario)
    @titulo = titulo
    @comentario = comentario
  end

  def comentar
    puts "Comentario hecho por: Usuario en #{@titulo} dice: #{@comentario}"
  end
end

module Aspecto 
  refine Post do
    def publish
      puts "LOG: Nuevo Blog #{@titulo} publicado: " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
      super
    end
  end

  refine Comentario do
    def comentar
      super
      puts "LOG: Comentario en publicación de: #{@titulo} fue publicado " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
    end
  end
end

$i = 0
$num = 4
nombresPosts = Array["Ruby on rails para principiantes",
  "15 gemas de ruby extremadamente útiles",
  "¿Como crear una gema en ruby?",
  "Técnicas de escritores amateurs"]

Coments = Array["Buena publicacion",
  "Cual es la mejor?",
  "El paso 3 no se entiende",
  "Tengo un post similar con mas tecnicas"]

using Aspecto
while $i < $num do
  Post.new(nombresPosts[$i]).publish
  Comentario.new(nombresPosts[$i], Coments[$i]).comentar
  puts "------"
  sleep 2
  $i += 1
end