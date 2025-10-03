#include <iostream>
#include <string>
#include <locale.h>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa() {} 
    Pessoa(string _nome, int _idade) : nome(_nome), idade(_idade) {}
    
    void setNome(string novoNome) {
        nome = novoNome;
        cout << "Nome definido para: " << nome << endl;
    }
    
    string getNome() const {
        return nome;
    }
    
    void setIdade(int novaIdade) {
        if (novaIdade >= 0) {
            idade = novaIdade;
            cout << "Idade definida para: " << idade << endl;
        } else {
            cout << "ERRO: Idade inválida. Deve ser um valor positivo." << endl;
        }
    }

    int getIdade() const {
        return idade;
    }
};

class Protagonista : public Pessoa {
private:

    int nivel;

public:
    Protagonista(string nome, int idade, int nivelInicial) : Pessoa(nome, idade), nivel(nivelInicial) {}
    
    Protagonista() : Pessoa() {}

    void setNivel(int novoNivel) {
        if (novoNivel > 0) {
            nivel = novoNivel;
        } else {
            cout << "ERRO: O nível deve ser maior que zero." << endl;
        }
    }

    int getNivel() const {
        return nivel;
    }

    void imprimirStatus() const {
        cout << "\nStatus do Protagonista" << endl;
        cout << "Nome: " << getNome() << endl;
        cout << "Idade: " << getIdade() << endl;
        cout << "Nível: " << getNivel() << endl;
    }
};

class Personagem : public Pessoa {
private:
    int rank; 

public:
    Personagem(string nome, int idade, int rankInicial) : Pessoa(nome, idade), rank(rankInicial) {}
    
    Personagem() : Pessoa() {}

    void setRank(int novoRank) {
        if (novoRank >= 0 && novoRank <= 10) {
            rank = novoRank;
        } else {
            cout << "ERRO: O rank deve ser entre 0 e 10. Rank não alterado." << endl;
        }
    }

    int getRank() const {
        return rank;
    }

    void imprimirStatus() const {
        cout << "\nStatus do Personagem (Aliado)" << endl;
        cout << "Nome: " << getNome() << endl;
        cout << "Idade: " << getIdade() << endl;
        cout << "Rank (Social Link): " << getRank() << "/10 " << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Portuguese");

    cout << "Demonstrando Encapsulamento e Herança" << endl;
    Protagonista prota("Joker", 16, 1);
    cout << "\nAtribuição de Valores" << endl;
    
    prota.setNome("Akira Kurusu"); 
    prota.setIdade(17);
    prota.setNivel(5); 

    Personagem aliado("Ryuji Sakamoto", 17, 0);

    aliado.setRank(7);
    aliado.setRank(15);

    cout << "\nImpressão de Valores" << endl;
    
    prota.imprimirStatus();
    aliado.imprimirStatus();

    cout << "\nAcesso Individual" << endl;
    cout << prota.getNome() << " está no nível " << prota.getNivel() << endl;

    return 0;
}
