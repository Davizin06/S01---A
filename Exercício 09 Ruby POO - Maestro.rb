class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "A subclasse deve implementar o método 'tocar_partitura'"
  end
  
  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    puts "#{nome} está lendo a partitura de '#{peca}' e tocando ao piano..."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    puts "#{nome} posiciona o violino para tocar a peça '#{peca}'..."
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "Maestro: Atenção, vamos ensaiar a peça: #{peca}!"
    puts "---INÍCIO DO ENSAIO---"
    
    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
    
    puts "---FIM DO ENSAIO---"
  end

  def mudar_foco(estado)
    puts "\nMaestro: Mudar foco para: #{estado}!"
    
    novo_estado = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
    
    return novo_estado
  end
end

puts "---Preparando a Orquestra---"

kousei = Pianista.new("Kousei")
kaori = Violinista.new("Kaori")
takeshi = Pianista.new("Takeshi")

lista_de_musicos = [kousei, kaori, takeshi]

maestro_hiroko = Maestro.new(lista_de_musicos)

peca_do_ensaio = "Twinkle, Twinkle, Little Star (Versão sombria)"

maestro_hiroko.iniciar_ensaio(peca_do_ensaio)

estados_de_foco = maestro_hiroko.mudar_foco("Concentrado")

puts estados_de_foco
