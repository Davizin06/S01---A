using System;
using System.Collections.Generic;
using System.Linq;


public class Feitico
{
    public string Nome { get; set; }
    public Feitico(string nome)
    {
        Nome = nome;
    }
}


public class Ferramenta
{
    public string Nome { get; set; }
    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

public class Grimorio
{
    private List<Feitico> Feiticos { get; set; }

    public Grimorio()
    {
    
        Feiticos = new List<Feitico>();
    }

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

public class Maga
{
    public Grimorio LivroMagico { get; }

    public List<Ferramenta> FerramentasSobrevivencia { get; }

    public Maga(List<Ferramenta> ferramentasExternas)
    {
        LivroMagico = new Grimorio();

        FerramentasSobrevivencia = ferramentasExternas;
    }

    public void DescreverEquipamento()
    {
        Console.WriteLine("\n--- Equipamento da Maga Frieren ---");
        
        LivroMagico.ListarFeiticos();

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
        List<Ferramenta> kitDeSobrevivencia = new List<Ferramenta>
        {
            new Ferramenta("Machadinha"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Cantil")
        };

        Maga frieren = new Maga(kitDeSobrevivencia);
        
        Console.WriteLine("A Maga Frieren foi criada e recebeu seu kit de sobrevivência.");

        frieren.LivroMagico.AdicionarFeitico(new Feitico("Ataque ao Zumbi"));
        frieren.LivroMagico.AdicionarFeitico(new Feitico("Voo"));
        
        frieren.DescreverEquipamento();
    }
}
