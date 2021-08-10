class Post
  def initialize(titulo)
    @titulo = titulo
  end

  def publicar
    puts "Post: #{@titulo} fue publicado"
  end
  def info
    puts "LOG: Post #{@titulo} publicado el:" + Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end

end

class Comentario
  def initialize(titulo)
    @titulo = titulo
  end

  def comentar
    puts "Comentario en publicación de: #{@titulo} fue publicado"
  end
  def info
    puts "LOG: Comentario en #{@titulo} publicado el: " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end

end

nuevoPost = Post.new("Ejemplo en ruby sin AOP")
nuevoPost.publicar
nuevoPost.info

nuevoComentario = Comentario.new("Ejemplo en ruby sin AOP")
nuevoComentario.comentar
nuevoComentario.info



