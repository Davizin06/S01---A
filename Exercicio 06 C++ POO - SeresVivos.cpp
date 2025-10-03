#include <iostream>
#include <string>
#include <vector>
#include <locale.h>

using namespace std;

class SerVivo {
protected:
    string nome;

public:
    SerVivo(string nomeInicial) : nome(nomeInicial) {}
    
    virtual void apresentar() const {
        cout << "Olá, meu nome é " << nome << " e eu sou um Ser Vivo genérico." << endl;
    }
    
    virtual ~SerVivo() {} 
};

class Humano : public SerVivo {
public:
    Humano(string nome) : SerVivo(nome) {}

    void apresentar() const override {
        cout << "Eu sou " << nome << ". Sou um Humano e minha determinação é minha força!" << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(string nome) : SerVivo(nome) {}

    void apresentar() const override {
        cout << "Saudações, eu sou " << nome << ". Um Elfo com laços ancestrais com a floresta." << endl;
    }
};

class Fada : public SerVivo {
public:
    Fada(string nome) : SerVivo(nome) {}

    void apresentar() const override {
        cout << "Eu sou " << nome << ". Uma Fada, trazendo magia e brilho ao mundo!" << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Portuguese");

    cout << "--- Encontro de Raças: Polimorfismo com std::vector ---" << endl;
    
    vector<SerVivo*> seresVivos;
    
    seresVivos.push_back(new Humano("Arthur"));
    seresVivos.push_back(new Elfo("Legolas"));
    seresVivos.push_back(new Fada("Titânia"));
    seresVivos.push_back(new Humano("Júlia"));

    cout << "\nChamando o método apresentar() para cada elemento na lista:\n" << endl;

    for (SerVivo* ser : seresVivos) {
        ser->apresentar();
    }
    
    cout << "\n--- Fim da Demonstração ---" << endl;

    for (SerVivo* ser : seresVivos) {
        delete ser;
    }

    return 0;
}
