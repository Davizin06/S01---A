using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} usou um ataque básico!");
    }
}

public class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} (Fogo) lança uma poderosa labareda!");
    }
}

public class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} (Água) lança um jato de água com força total!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Pokemon> timePokemon = new List<Pokemon>();

        PokemonDeFogo charizard = new PokemonDeFogo("Charizard");
        PokemonDeAgua blastoise = new PokemonDeAgua("Blastoise");
        Pokemon pikachu = new Pokemon("Pikachu");

        timePokemon.Add(charizard);
        timePokemon.Add(blastoise);
        timePokemon.Add(pikachu);

        Console.WriteLine("--- O Time Pokémon está atacando ---");

        foreach (var pokemon in timePokemon)
        {
            pokemon.Atacar();
        }
    }
}
