module Rastreavel
  def obter_localizacao(hora)
    raise NotImplementedError, "Quem incluir Rastreavel deve implementar 'obter_localizacao'"
  end
end

module Perigoso
  def calcular_risco
    raise NotImplementedError, "Quem incluir Perigoso deve implementar 'calcular_risco'"
  end
end

class Participante
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
  
  def to_s
    "Participante: #{@nome}"
  end
end

class Detetive < Participante
  include Rastreavel
  
  def initialize(nome, localizacao_atual)
    super(nome)
    @localizacao_atual = localizacao_atual
  end

  def obter_localizacao(hora)
    return "Às #{hora}, #{@nome} estava em #{@localizacao_atual}."
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def initialize(nome, localizacao_atual, nivel_risco)
    super(nome)
    @localizacao_atual = localizacao_atual
    @nivel_risco = nivel_risco
  end

  def obter_localizacao(hora)
    return "Às #{hora}, #{@nome} estava... (localização ofuscada)."
  end
  
  def calcular_risco
    return @nivel_risco * 10
  end
  
  def to_s
    "[PERIGO] #{super}"
  end
end

class Cenario
  def initialize(participantes)
    @participantes = participantes
  end
  
  def identificar_ameacas
    puts "\n[Cenário] Verificando ameaças..."
    
    ameacas = @participantes.select do |p|
      p.respond_to?(:calcular_risco)
    end
    
    return ameacas
  end
  
  def obter_localizacoes(hora)
    puts "\n[Cenário] Obtendo localizações às #{hora}..."
    @participantes.each do |p|
      if p.respond_to?(:obter_localizacao)
        puts p.obter_localizacao(hora)
      else
        puts "#{p.nome} não é rastreável."
      end
    end
  end
end

puts "---Jogo das Sombras---"

local_sherlock = "221B Baker Street"
local_moriarty = "Covent Garden"

sherlock = Detetive.new("Sherlock", local_sherlock)
moriarty = MestreDoCrime.new("Moriarty", local_moriarty, 9000)
watson = Participante.new("Watson")

lista_de_participantes = [sherlock, moriarty, watson]

cenario_londres = Cenario.new(lista_de_participantes)

cenario_londres.obter_localizacoes("14:30")

alvos_perigosos = cenario_londres.identificar_ameacas

puts "\n--- ALVOS PERIGOSOS IDENTIFICADOS ---"
if alvos_perigosos.empty?
  puts "Nenhuma ameaça encontrada."
else
  puts alvos_perigosos
end
