require './targets.rb'
load './aspecto.rb'

$i = 0
nombresPosts = Array["Ruby on rails para principiantes",
  "15 gemas de ruby extremadamente útiles",
  "¿Como crear una gema en ruby?",
  "Técnicas de escritores amateurs"]

coments ={ "User2" => "El paso 3 no se entiende", "User1" => "#@!p@%",
  "User3" => "Tengo un post similar con mas tecnicas",
  "User4" => "Muy buena publicacion, gracias!!"}


using Aspecto
coments.each do | key, value |
  Post.new(nombresPosts[$i]).publish
  sleep 1
  if coments[key] != "#@!p@%"
    Comentario.new(nombresPosts[$i], key, value).comentar
  else
    Comentario.new(nombresPosts[$i], key, value).comentarioMalicioso
  end
  puts "------"
  sleep 1
  $i += 1
end

notificacion = TracePoint.new(:return) do |tp|
  if tp.defined_class == Usuario && tp.method_id == :iniciarChat
    puts "El usuario: #{tp.binding.receiver.nombre} está usando el proxy de comunicación"
  end
end

notificacion.enable
Usuario.new("Carlos").iniciarChat
#trace.disable


