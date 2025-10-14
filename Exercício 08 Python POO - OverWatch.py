from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")
    
    def usar_ultimate(self):
        print(f"{self.nome} (Tanque): ATIVANDO Ultimate! Esmaga o chão e prende os inimigos! (Reinhardt/Zarya)")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f" {self.nome} (Dano): ATIVANDO Ultimate! Executa um ataque rápido e fatal! (Genji/Soldier)")


if __name__ == '__main__':
    reinhardt = Tanque(nome="Reinhardt")
    genji = Dano(nome="Genji")
    orisa = Tanque(nome="Orisa") 

    lista_de_herois = [reinhardt, genji, orisa]

    print("\n--- INÍCIO DA PARTIDA: ULTIMATES PRONTAS ---")

    for heroi in lista_de_herois:
        heroi.usar_ultimate()

    print("\n--- FIM DA PARTIDA ---")
