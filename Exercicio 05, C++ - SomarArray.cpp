#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho) {
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    int tamanho;

    cout << "Digite o tamanho" << endl;
    cin >> tamanho;

    float arr[tamanho]; 

    cout << "Digite " << tamanho << " valores:" << endl;
    
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);

    cout << "Resultado da soma dos elementos: " << resultado << endl;

    return 0;
}
