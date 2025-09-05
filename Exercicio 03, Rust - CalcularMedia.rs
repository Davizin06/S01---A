fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let soma_pesos = 2.0 + 3.0 + 5.0;
    (nota1 * 2.0 + nota2 * 3.0 + nota3 * 5.0) / soma_pesos
}

fn main() {
    let nota1 = 7.5;
    let nota2 = 8.0;
    let nota3 = 9.2;

    let media = calcular_media(nota1, nota2, nota3);

    println!("Média do aluno: {:.2}", media);

    if media >= 7.0 {
        println!("Aprovado");
    } else {
        println!("Reprovado");
    }
}
