use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
  
    println!("Digite o número da tabuada:");
    let mut numero = String::new();
    io::stdin().read_line(&mut numero).expect("Erro ao ler entrada");
    let numero: i32 = numero.trim().parse().expect("Digite um número válido!");
  
    println!("Digite o limite inferior:");
    let mut limite_inferior = String::new();
    io::stdin().read_line(&mut limite_inferior).expect("Erro ao ler entrada");
    let limite_inferior: i32 = limite_inferior.trim().parse().expect("Digite um número válido!");

    println!("Digite o limite superior:");
    let mut limite_superior = String::new();
    io::stdin().read_line(&mut limite_superior).expect("Erro ao ler entrada");
    let limite_superior: i32 = limite_superior.trim().parse().expect("Digite um número válido!");

    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
