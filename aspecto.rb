
module Aspecto 

  #Consejos AFTER
  refine Post do
    def publish #pointcut
      super
      ip1 = 170 + rand(9) 
      ip2 = 190 + rand(9)
      ip3 = 20 + rand(20)
      ip4 = 100 + rand(70) 
      puts "GRABAR LOG: Nuevo Blog #{@titulo} publicado: " + Time.now.strftime("%d/%m/%Y %H:%M:%S") + " desde ip: " + ip1.to_s+"."+ ip2.to_s+"."+ip3.to_s+"."+ip4.to_s
    end
  end

  refine Comentario do
    def comentar #pointcut
      super
      puts "GRABAR LOG: Comentario en publicación de: #{@titulo} fue publicado " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
    end
  end

  #Consejos BEFORE
  refine Comentario do
    def comentarioMalicioso #pointcut
      puts "ALERTA: Comentario bloqueado en publicación de: #{@titulo} con fecha de: " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
      super
    end
  end

  refine Usuario do
    def iniciarChat #pointcut
      puts "BEFORE ----- Notificacion: Se está Iniciando el proxy de comunicacion"
      super
      puts "AFTER ------ Ejecutando proxy de comunicación para chatInterno"
    end
  end

end

