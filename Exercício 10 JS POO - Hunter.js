class Hunter {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, local, idade) {
    this.#nome = nome;
    this.#localizacao = local;
    this.#idade = idade;
  }

  getNome() {
    return this.#nome;
  }

  getLocalizacao() {
    return this.#localizacao;
  }
}

class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, local, idade, habilidade) {
    super(nome, local, idade);
    this.#habilidadeNen = habilidade;
  }

  rastrearLocal(lat, long) {
    return `Especialista ${this.getNome()} usa '${this.#habilidadeNen}' para rastrear [${lat}, ${long}]. Localização atual: ${this.getLocalizacao()}`;
  }
}

class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome, local, idade) {
    super(nome, local, idade);
    this.#alvoAtual = null;
  }

  setAlvo(alvo) {
    this.#alvoAtual = alvo;
  }

  rastrearLocal(lat, long) {
    let alvoNome = this.#alvoAtual ? this.#alvoAtual.getNome() : "ninguém";
    return `Manipulador ${this.getNome()} rastreia seu alvo (${alvoNome}) para [${lat}, ${long}]. Posição: ${this.getLocalizacao()}`;
  }
}

class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    this.#hunters.add(hunter);
    console.log(`(Hunter ${hunter.getNome()} adicionado ao Batalhão.)`);
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {
    let relatoriosRastreamento = [];
    console.log(`\n---Iniciando Rastreamento para [${lat}, ${long}]---`);

    this.#hunters.forEach(hunter => {
      if (typeof hunter.rastrearLocal === 'function') {
        relatoriosRastreamento.push(hunter.rastrearLocal(lat, long));
      } else {
        relatoriosRastreamento.push(`Hunter ${hunter.getNome()} não é um rastreador.`);
      }
    });

    return relatoriosRastreamento;
  }
}

console.log("---Associação Hunter: Batalhão---");

const gon = new Especialista("Gon Freecss", "Ilha da Baleia", 12, "Reforço (Jajanken)");
const killua = new Especialista("Killua Zoldyck", "Montanha Kukuroo", 12, "Transformação (Eletricidade)");
const kurapika = new Manipulador("Kurapika", "Desconhecido", 17);
const leorio = new Hunter("Leorio Paradinight", "Zaban", 19); 

kurapika.setAlvo(leorio); 

const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(killua);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(leorio);

console.log(`\nTotal de Hunters no Batalhão: ${batalhao.getNumHunters()}`);

const relatorios = batalhao.iniciarRastreamento("22.1N", "44.5W");
relatorios.forEach(r => console.log(r));

console.log("\n--- Tentativa de adicionar duplicata ---");
batalhao.adicionarHunter(gon); 
console.log(`Total de Hunters no Batalhão: ${batalhao.getNumHunters()}`);
