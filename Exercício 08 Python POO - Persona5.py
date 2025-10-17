from typing import List

class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"Arma: {self.nome} (Dano: {self.dano})"


class PhantomThieves:
    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome

    def __str__(self):
        return f"[Membro] Nome: {self.nome}, Codinome: {self.codinome}"


class Joker:
    def __init__(self, lista_membros: List[PhantomThieves]):
      
        self.arma = ArmaCorpoACorpo(nome="Faca de Combate", dano=30)
        self.equipe = lista_membros

    def mostrar_equipe(self):
        print("-" * 30)
        print(f"JOKER: Lider da Equipe, armado com: {self.arma.nome} (Dano: {self.arma.dano})")
        print("MEMBROS DO PHANTOM THIEVES (AGREGAÇÃO):")
        
        if not self.equipe:
            print("  [Equipe vazia]")
            return

        for membro in self.equipe:
            print(f"  > {membro}")


if __name__ == '__main__':
    
    membro_morgana = PhantomThieves("Morgana", "Mona")
    membro_ryuji = PhantomThieves("Ryuji Sakamoto", "Skull")
    membro_ann = PhantomThieves("Ann Takamaki", "Panther")

    ladroes_do_coracao = [membro_morgana, membro_ryuji, membro_ann]

    protagonista = Joker(lista_membros=ladroes_do_coracao)
    
    protagonista.mostrar_equipe()

    print("\n--- Teste de Agregação (Membro existe fora do 'Joker') ---")
    print(f"Objeto Morgana original: {membro_morgana}")
