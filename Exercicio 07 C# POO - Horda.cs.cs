using System;

public abstract class MonstroSombrio
{
    public string Nome { get; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public virtual void Mover()
    {
        Console.WriteLine($"{Nome} está se movendo de forma genérica.");
    }
}

public class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} (Zumbi) se arrasta lentamente, emitindo um gemido...");
    }
}

public class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} (Espectro) desliza rapidamente através das paredes, invisível!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("--- A Horda Sombria se aproxima ---");

        MonstroSombrio[] horda = new MonstroSombrio[3];

        horda[0] = new Zumbi("Zumbi Lento 1");
        horda[1] = new Espectro("Espectro Rápido");
        horda[2] = new Zumbi("Zumbi Lento 2");

        Console.WriteLine("\nIniciando o movimento da horda:");

        foreach (var monstro in horda)
        {
            monstro.Mover();
        }

        Console.WriteLine("\nA horda terminou de se mover. O processamento foi uniforme.");
    }
}
