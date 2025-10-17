from abc import ABC, abstractmethod
from typing import List

class Cibernetico(ABC):
    def __init__(self, nome: str):
        self.nome = nome
        
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, nome: str, custo: int, funcao: str):
        self.nome = nome
        self.custo = custo
        self.funcao = funcao
    
    def __str__(self):
        return f"Implante: {self.nome} (Custo: {self.custo} Eddies, Função: {self.funcao})"


class NetRunner(Cibernetico):
    def __init__(self, nome: str):
        super().__init__(nome)
        self.implante = Implante(nome="Módulo de Overclock", custo=50000, funcao="Acesso Remoto")

    def realizar_hack(self):
        print(f"[{self.nome} - NetRunner] executando Hack com o {self.implante.nome}: Injetando vírus e desativando sistemas...")

    def mostrar_implante(self):
        print(f"  {self.nome} está equipado com: {self.implante}")


class Faccoes:
    def __init__(self, nome_faccao: str, membros: List[Cibernetico]):
        self.nome = nome_faccao
        self.membros = membros

    def comandar_hack(self):
        print(f"\n<<< FACÇÃO {self.nome.upper()} COMANDANDO HACK GERAL! >>>")
        
        if not self.membros:
            print("  [Nenhum membro cibernético na facção para executar o hack.]")
            return

        for membro in self.membros:
            membro.realizar_hack()


if __name__ == '__main__':
    netrunner_a = NetRunner(nome="Ghost")
    netrunner_b = NetRunner(nome="Razor")

    print("--- Detalhes dos NetRunners ---")
    netrunner_a.mostrar_implante()
    netrunner_b.mostrar_implante()
    
    faccao_maxtac = Faccoes(
        nome_faccao="Arasaka", 
        membros=[netrunner_a, netrunner_b]
    )

    faccao_maxtac.comandar_hack()
