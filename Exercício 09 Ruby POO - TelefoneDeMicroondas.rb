class MicroondasUnidade
  def aquecer_por(segundos)
    puts "[MicroondasUnidade] Aquecendo dados por #{segundos}s para envio..."
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end
  
  def to_s
    return "[#{hora_envio}] - #{conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @lista_dmails = []
  end

  def enviar_dmail(conteudo, hora_envio)
    puts "\nIniciando envio de D-Mail..."
    
    @unidade.aquecer_por(5) 
    
    novo_dmail = DMail.new(conteudo, hora_envio)
    @lista_dmails.push(novo_dmail)
    
    puts "D-Mail enviado: #{novo_dmail.conteudo}"
  end

  def listar_dmails_recentes(horario_corte)
    puts "\n--- Filtrando D-Mails (posteriores a #{horario_corte}) ---"
    
    recentes = @lista_dmails.select do |dmail|
      dmail.hora_envio > horario_corte
    end
    
    return recentes
  end
end

puts "---Ativando o Telefone de Microondas---"

telefone = TelefoneDeMicroondas.new

telefone.enviar_dmail("Reunião cancelada.", "09:15")
telefone.enviar_dmail("El Psy Kongroo.", "10:30")
telefone.enviar_dmail("Steins;Gate alcançado!", "11:05")
telefone.enviar_dmail("A SERN está a vigiar.", "11:45")

horario_para_filtrar = "11:00"

mensagens_recentes = telefone.listar_dmails_recentes(horario_para_filtrar)

if mensagens_recentes.empty?
  puts "Nenhuma mensagem encontrada após as #{horario_para_filtrar}."
else
  puts mensagens_recentes
end
