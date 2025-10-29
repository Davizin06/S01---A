class Pokemon {
  #vida;
  nome;
  tipo;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) {
      this.#vida = 0;
    }
    console.log(`${this.nome} recebeu ${dano} de dano. Vida restante: ${this.#vida}`);
  }

  receberCura(cura) {
    this.#vida += cura;
    console.log(`${this.nome} recuperou ${cura} de vida. Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} usa Ataque Básico em ${alvo.nome}.`);
    alvo.receberDano(5);
  }
}

class PokemonFogo extends Pokemon {
  bonusAtaque;

  constructor(nome, vidaInicial, bonus) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonus;
  }

  atacar(alvo) {
    const danoTotal = 10 + this.bonusAtaque;
    console.log(`${this.nome} usa Lança-Chamas em ${alvo.nome} causando ${danoTotal} de dano!`);
    alvo.receberDano(danoTotal);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    console.log(`${this.nome} usa Jato de Água em ${alvo.nome}.`);
    alvo.receberDano(8);
    
    console.log(`${this.nome} também se cura usando seu poder de Água.`);
    this.receberCura(this.#curaBase);
  }
}

console.log("---Iniciando a Batalha Pokémon---");

const charizard = new PokemonFogo("Charizard", 100, 5);
const blastoise = new PokemonAgua("Blastoise", 120, 3);
const pidgey = new Pokemon("Pidgey", 50, "Normal");

console.log(`\nEstado Inicial:`);
console.log(`> ${charizard.nome} (Tipo: ${charizard.tipo}) | Vida: ${charizard.getVida()}`);
console.log(`> ${blastoise.nome} (Tipo: ${blastoise.tipo}) | Vida: ${blastoise.getVida()}`);
console.log(`> ${pidgey.nome} (Tipo: ${pidgey.tipo}) | Vida: ${pidgey.getVida()}`);

console.log("\n--- Turno 1: Fogo ataca Água ---");
charizard.atacar(blastoise);

console.log("\n--- Turno 2: Água ataca Fogo ---");
blastoise.atacar(charizard);

console.log("\n--- Turno 3: Genérico ataca Fogo ---");
pidgey.atacar(charizard);

console.log("\n---Estado Final da Batalha---");
console.log(`> ${charizard.nome} | Vida: ${charizard.getVida()}`);
console.log(`> ${blastoise.nome} | Vida: ${blastoise.getVida()}`);
console.log(`> ${pidgey.nome} | Vida: ${pidgey.getVida()}`);
