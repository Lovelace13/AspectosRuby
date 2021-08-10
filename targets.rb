class Post
  def initialize(titulo)
    @titulo = titulo
  end

  def publish
    puts "New Post: #{@titulo} fue publicado"
  end
end

class Comentario
  def initialize(titulo, user, com)
    @titulo = titulo
    @usuario = user
    @coment = com
  end

  def comentar
    puts "Comentario hecho por: #{@usuario} en #{@titulo} dice: #{@coment}"
  end

  def comentarioMalicioso
    puts "Contenido bloqueado por incumplir politicas del sitio. Usuario: #{@usuario} en el titulo: #{@titulo}"
  end
end

class Usuario
  attr_reader :nombre

  def initialize(nombre)
    @nombre = nombre
  end

  def iniciarChat
    puts "Estoy iniciando sesion para el ChatInterno en el servidor para Bloggers"
  end

end