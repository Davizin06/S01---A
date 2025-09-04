use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 8 {
        return false;
    }
    let mut numero = false;
    let mut maiuscula = false;

    for c in senha.chars() {
        if c.is_ascii_digit() {
            numero = true;
        }
        if c.is_ascii_uppercase() {
            maiuscula = true;
        }
    }

    numero && maiuscula
}

fn main() {
    loop {
        println!("Digite uma senha: ");
        let mut senha = String::new();
        io::stdin().read_line(&mut senha).expect("Falha ao ler entrada");

        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida! Tente novamente.");
        }
    }
}
