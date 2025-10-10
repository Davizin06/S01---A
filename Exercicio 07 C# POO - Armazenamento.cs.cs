using System;
using System.Collections.Generic;
using System.Linq;

// 1. Crie a classe Feitico.
public class Feitico
{
    public string Nome { get; set; }
    public Feitico(string nome)
    {
        Nome = nome;
    }
}

// 3. Crie a classe Ferramenta.
public class Ferramenta
{
    public string Nome { get; set; }
    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

// 2. Crie a classe Grimorio que compõe uma lista (List<Feitico>). (Composição)
public class Grimorio
{
    private List<Feitico> Feiticos { get; set; }

    public Grimorio()
    {
        // A lista é criada aqui, indicando que o Grimório gerencia seus Feitiços.
        Feiticos = new List<Feitico>();
    }

    // Método para adicionar feitiços.
    public void AdicionarFeitico(Feitico feitico)
    {
        Feiticos.Add(feitico);
        Console.WriteLine($"Feitiço '{feitico.Nome}' adicionado ao Grimório.");
    }

    public void ListarFeiticos()
    {
        if (Feiticos.Any())
        {
            Console.WriteLine("Feitiços no Grimório:");
            foreach (var f in Feiticos)
            {
                Console.WriteLine($"- {f.Nome}");
            }
        }
    }
}

// 4. Crie a classe Maga (Frieren) que compõe um Grimorio e agrega uma lista de Ferramentas.
public class Maga
{
    // Composição: O Grimorio é inicializado internamente e não existe sem a Maga.
    public Grimorio LivroMagico { get; }

    // Agregação: A lista de ferramentas é fornecida externamente (pode existir sem a Maga).
    public List<Ferramenta> FerramentasSobrevivencia { get; }

    public Maga(List<Ferramenta> ferramentasExternas)
    {
        // Composição: Inicialização interna.
        LivroMagico = new Grimorio();

        // Agregação: Recebe a lista externa por parâmetro.
        FerramentasSobrevivencia = ferramentasExternas;
    }

    public void DescreverEquipamento()
    {
        Console.WriteLine("\n--- Equipamento da Maga Frieren ---");
        
        // 6. Lista os feitiços no Grimório (Composição)
        LivroMagico.ListarFeiticos();

        // 6. Imprime o nome das ferramentas que ela agregou (Agregação).
        Console.WriteLine("\nFerramentas de Sobrevivência (Agregação):");
        foreach (var f in FerramentasSobrevivencia)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        // 5. No main, crie uma lista de Ferramentas (Agregação - Elas existem sozinhas).
        List<Ferramenta> kitDeSobrevivencia = new List<Ferramenta>
        {
            new Ferramenta("Machadinha"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Cantil")
        };

        // 5. Crie a instância de Maga (Frieren), inicializando-a com seu Grimório (Composição) 
        // e passando a lista de Ferramentas (Agregação).
        Maga frieren = new Maga(kitDeSobrevivencia);
        
        Console.WriteLine("A Maga Frieren foi criada e recebeu seu kit de sobrevivência.");

        // 6. Adicione feitiços ao Grimório de Frieren.
        frieren.LivroMagico.AdicionarFeitico(new Feitico("Ataque ao Zumbi"));
        frieren.LivroMagico.AdicionarFeitico(new Feitico("Voo"));
        
        frieren.DescreverEquipamento();
    }
}
