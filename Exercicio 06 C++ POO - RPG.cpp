#include <iostream>
#include <string>
#include <locale.h>

using namespace std;

class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;

    Personagem(string nome, int nivel, int dano, int vida) {
        this->nome = nome;
        this->nivel = nivel;
        this->dano = dano;
        this->vida = vida;
    }

    void atacar(Personagem &alvo) {
        cout << this->nome << " atacou " << alvo.nome << "!" << endl;
        alvo.vida -= this->dano;
        cout << alvo.nome << " perdeu " << this->dano << " pontos de vida" << endl;
    }
    
    void mostrarInformacoes() {
    	cout << "===============" << endl;
        cout << "Informações de " << nome << endl;
        cout << "Nível: " << nivel << endl;
        cout << "Dano de Ataque: " << dano << endl;
        cout << "Vida: " << vida << endl;
    }
};

int main() {

    Personagem heroi("Aragorn", 10, 25, 100); 
    Personagem vilao("Orc Líder", 8, 15, 80);

    heroi.atacar(vilao);
    vilao.atacar(heroi);

    cout << "Informações após o combate:" << endl;
    heroi.mostrarInformacoes();
    vilao.mostrarInformacoes();
   
    return 0;
}
