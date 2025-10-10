using System;

public class MembroDaSociedade
{
    private string nome;
    private string raca;
    private string funcao;

    public MembroDaSociedade(string nome, string raca, string funcao)
    {
        this.nome = nome;
        this.raca = raca;
        this.funcao = funcao;
    }

    public void Descrever()
    {
        Console.WriteLine($"--- Membro da Sociedade ---");
        Console.WriteLine($"Nome: {nome}");
        Console.WriteLine($"Raça: {raca}");
        Console.WriteLine($"Função: {funcao}");
        Console.WriteLine("---------------------------\n");
    }
}

class Program
{
    static void Main(string[] args)
    {
        MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Argueiro");

        Console.WriteLine("Informações da Sociedade do Anel:\n");
        aragorn.Descrever();
        legolas.Descrever();
    }
}
