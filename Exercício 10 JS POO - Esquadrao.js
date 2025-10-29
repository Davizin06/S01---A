class IExplorador {
  explorarTerritorio() {
    throw new Error("O método 'explorarTerritorio' deve ser implementado pela subclasse.");
  }
}

class ODM_gear {
  modelo;
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }

  usarGas(quantidade) {
    if (this.#gasRestante >= quantidade) {
      this.#gasRestante -= quantidade;
      console.log(`(ODM: Gás usado. Restante: ${this.#gasRestante})`);
      return true;
    } else {
      console.log("(ODM: Gás insuficiente!)");
      return false;
    }
  }

  getGas() {
    return this.#gasRestante;
  }
}

class Soldado extends IExplorador {
  nome;
  #gear;

  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.#gear = new ODM_gear(modeloGear);
  }

  explorarTerritorio() {
    if (this.#gear.usarGas(10)) {
      return `Soldado ${this.nome} está explorando o território.`
    } else {
      return `Soldado ${this.nome} não pode explorar (sem gás).`
    }
  }

  verificarEquipamento() {
    return `${this.nome} | Equipamento: ${this.#gear.modelo} | Gás: ${this.#gear.getGas()}%`;
  }

  getStatus() {
    return `Soldado: ${this.nome}, Gás: ${this.#gear.getGas()}%`;
  }
}

class Esquadrao extends IExplorador {
  #lider;
  #membros;

  constructor(lider, membrosIniciais = []) {
    super();
    this.#lider = lider;
    this.#membros = [lider, ...membrosIniciais];
  }

  adicionarMembro(soldado) {
    if (soldado instanceof Soldado) {
      this.#membros.push(soldado);
      console.log(`\n>> ${soldado.nome} foi adicionado ao Esquadrão de ${this.#lider.nome}.`);
    } else {
      console.log("\n>> Erro: Apenas objetos 'Soldado' podem ser adicionados.");
    }
  }

  relatarStatus() {
    let statusArray = [];
    statusArray.push(`--- Relatório do Esquadrão de ${this.#lider.nome} ---`);
    this.#membros.forEach(membro => {
      statusArray.push(membro.getStatus());
    });
    return statusArray;
  }

  explorarTerritorio() {
    console.log(`\n--- ${this.#lider.nome} ordena: Esquadrão, explorar! ---`);
    let resultados = [];
    this.#membros.forEach(soldado => {
      resultados.push(soldado.explorarTerritorio());
    });
    return resultados.join('\n');
  }
}

console.log("---Preparando o Esquadrão---");

const levi = new Soldado("Levi Ackerman", "Modelo Tático Avançado");
const mikasa = new Soldado("Mikasa Ackerman", "Modelo Padrão");
const armin = new Soldado("Armin Arlert", "Modelo Leve de Longo Alcance");

const esquadraoLevi = new Esquadrao(levi, [mikasa]);

esquadraoLevi.adicionarMembro(armin);

console.log("\n---Demonstração: Verificando Equipamentos---");
console.log(levi.verificarEquipamento());
console.log(mikasa.verificarEquipamento());

const relatorioExploracao = esquadraoLevi.explorarTerritorio();
console.log(relatorioExploracao);

const statusFinal = esquadraoLevi.relatarStatus();
console.log("\n" + statusFinal.join('\n'));
