module ReservasHelper
    def generarOpcionesReserva
        @reservas = Reserva.where(evento_id: params[:id1])
        @evento = Evento.find(params[:id1])
        @botones = {}
        differencia = (@evento.end_time - @evento.start_time)
        diffPlazo = (@evento.plazoDeTiempo.hour * 60 * 60) + (@evento.plazoDeTiempo.min * 60)
        cantidadBotones = differencia / diffPlazo
        cantidadBotones = cantidadBotones.to_i
        contador = @evento.start_time
        cantidadBotones.times do |i|
            if validacionReserva
                @botones[:"#{contador.strftime("%H:%M")}"] = contador
                contador = contador + diffPlazo
            end
        end
    end

    def validacionReserva
        @reservas.each do |reserva|
          if reserva.horario.hour == contador.hour && reserva.horario.min == contador.min
            return false
          end
        end
        return true
    end
end
