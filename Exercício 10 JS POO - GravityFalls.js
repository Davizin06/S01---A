class Personagem {
  nome;
  idade;

  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  diario_3;

  constructor(nome, idade) {
    super(nome, idade);
  }
}

class Criatura {
  nome;
  perigosa;

  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;
  enigmas;
  criaturasAvistadas;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
    console.log(`(Diário: Novo enigma ${num} adicionado.)`);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "ERRO: Chave do autor incorreta!";
    }

    if (!this.enigmas.has(num)) {
      return "ERRO: Enigma não encontrado.";
    }

    const enigmaDecodificado = this.enigmas.get(num);
    return `ENIGMA ${num}: ${enigmaDecodificado}`;
  }
}

class CabanaMisterio {
  visitantes;
  #funcionarios;

  constructor(diario) {
    this.visitantes = [];
    this.#funcionarios = [];
  }

  adicionarFuncionario(personagem) {
    if (personagem instanceof Personagem) {
      this.#funcionarios.push(personagem);
      console.log(`${personagem.nome} agora trabalha na Cabana do Mistério.`);
    }
  }

  listarFuncionarios() {
    return this.#funcionarios;
  }
}

console.log("---Bem-vindo a Gravity Falls---");

const stan = new Personagem("Stanley Pines", 65);
const soos = new Personagem("Soos Ramirez", 22);
const wendy = new Personagem("Wendy Corduroy", 15);

const diarioAntigo = new Diario("FordPines");

diarioAntigo.adicionarEnigma(1, "OS GOLFINHOS SÃO UMA AMEAÇA.");
diarioAntigo.adicionarEnigma(2, "A CIFRA ZODIACAL É A CHAVE.");

const dipper = new Protagonista("Dipper Pines", 12);
dipper.diario_3 = diarioAntigo; 

const cabana = new CabanaMisterio(dipper.diario_3);

cabana.adicionarFuncionario(stan);
cabana.adicionarFuncionario(soos);
cabana.adicionarFuncionario(wendy);

console.log("\n---Tentando decodificar enigmas---");
console.log(dipper.diario_3.decodificar("ChaveErrada", 1));
console.log(dipper.diario_3.decodificar("FordPines", 99));
console.log(dipper.diario_3.decodificar("FordPines", 1));

console.log("\n---Funcionários da Cabana do Mistério---");
const listaDeFuncionarios = cabana.listarFuncionarios();

listaDeFuncionarios.forEach(func => {
  console.log(`- ${func.nome} (Idade: ${func.idade})`);
});
