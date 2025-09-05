use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    
    println!("Jogador 1, escolha 'par' ou 'impar':");
    let mut escolha = String::new();
    io::stdin().read_line(&mut escolha).expect("Erro ao ler entrada");
    let escolha = escolha.trim().to_lowercase();
    
    println!("Jogador 1, digite um numero inteiro:");
    let mut num1 = String::new();
    io::stdin().read_line(&mut num1).expect("Erro ao ler entrada");
    let num1: i32 = num1.trim().parse().expect("Digite um numero válido!");

    println!("Jogador 2, digite um numero inteiro:");
    let mut num2 = String::new();
    io::stdin().read_line(&mut num2).expect("Erro ao ler entrada");
    let num2: i32 = num2.trim().parse().expect("Digite um numero válido!");
    
    let soma = num1 + num2;
    println!("A soma dos números é: {}", soma);
   
    let soma_par = eh_par(soma);

    if (soma_par && escolha == "par") || (!soma_par && escolha == "impar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
