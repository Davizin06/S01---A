class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self) -> int:
        return self._vida

    @vida.setter
    def vida(self, novo_valor: int):
        if novo_valor >= 0:
            self._vida = novo_valor
        else:
            self._vida = 0

    @property
    def resistencia(self) -> int:
        return self._resistencia

    def __str__(self) -> str:
        return f"Personagem com {self.vida} de vida e {self.resistencia} de resistência"


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool = True):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self) -> str:
        base_info = super().__str__()
        armadura_status = "Possui Armadura Pesada." if self.armadura_pesada else "Não possui Armadura Pesada."
        return f"Cavaleiro! {base_info}. {armadura_status}"
