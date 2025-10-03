#include <iostream>
#include <string>
#include <locale.h>

using namespace std;

class Pessoa {
protected:
    string nome;

public:
    Pessoa(string nomeInicial) : nome(nomeInicial) {}
    
    virtual void apresentar() const {
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
    
    virtual ~Pessoa() {} 
};

class Professor : public Pessoa {
private:
    string disciplina;

public:
    Professor(string nome, string disc) : Pessoa(nome), disciplina(disc) {}

    void apresentar() const override {
        cout << "Olá, meu nome é " << nome << " e eu sou um professor de [" << disciplina << "]." << endl;
    }
};

class Aluno : public Pessoa {
private:
    string curso;
    string matricula;

public:
    Aluno(string nome, string crs, string mat) : Pessoa(nome), curso(crs), matricula(mat) {}

    void apresentar() const override {
        cout << "Olá, meu nome é " << nome << " e eu sou um aluno de [" << curso << "]." << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Portuguese");

    Professor profA("Alexandre", "Circuitos");
    Aluno alunoB("Bia Soares", "Engenharia", "20231234");
    
    Pessoa *ponteiro1; 
    Pessoa *ponteiro2;

    ponteiro1 = &profA; 
    ponteiro2 = &alunoB; 

    cout << "--- Demonstração do Polimorfismo ---" << endl;

    ponteiro1->apresentar(); 
    ponteiro2->apresentar(); 
    
    cout << "------------------------------------" << endl;

    return 0;
}
