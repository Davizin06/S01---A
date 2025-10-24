class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  def preco_base
    return @preco_base
  end

  def preco_base=(valor)
    if valor <= 0
      raise "O preço base deve ser um valor positivo."
    else
      @preco_base = valor
    end
  end

  def preco_final
    return @preco_base
  end

  def to_s
    return "Drink: #{@nome}"
  end
end

class DrinkLenda < Drink
  attr_reader :anos_desde_criacao

  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    bonus = @anos_desde_criacao * 5
    return preco_base + bonus
  end

  def to_s
    return "#{super} (Lenda de #{@anos_desde_criacao} anos)"
  end
end


puts "---Bem-vindo ao Bar AfterLife---"
puts "Registando um DrinkLenda (versão de teste)..."


nome_input = "Elixir das Sombras"
preco_input = 20.0
anos_input = 10

puts "\nProcessando..."

begin
  drink_lendario = DrinkLenda.new(nome_input, preco_input, anos_input)

  puts "\n---FICHA DO DRINK---"
  puts drink_lendario
  puts "Preço Base: R$ #{drink_lendario.preco_base}"
  puts "Preço Final (com bônus de lenda): R$ #{drink_lendario.preco_final}"

rescue StandardError => e
  puts "\nErro ao criar o drink: #{e.message}"
end

