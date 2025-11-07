public class MainExercicio1 {

    public static void main(String[] args) {
        
        System.out.println("--- Teste de Personagem e Herança ---");
      
        Personagem sophie = new Personagem("Sophie", 18);
        System.out.println("Personagem criado: " + sophie.getNome() + ", Idade: " + sophie.getIdade());

        Mago howl = new Mago("Mago Howl", 27, "Fogo");
        System.out.println("Mago criado: " + howl.getNome() + ", Magia: " + howl.getMagia());
        
        System.out.println(howl.lancarFeitico());
      
        System.out.println("\n--- Teste de Agregação (Castelo e Divisões) ---");

        Castelo casteloAnimado = new Castelo("Castelo Animado");
        System.out.println("Castelo '" + casteloAnimado.nome + "' criado.");

        Divisao salaPrincipal = new Divisao("Sala Principal");
        Divisao cozinha = new Divisao("Cozinha Mágica");
        Divisao quartoHowl = new Divisao("Quarto do Howl");

        casteloAnimado.adicionarDivisao(salaPrincipal);
        casteloAnimado.adicionarDivisao(cozinha);
        casteloAnimado.adicionarDivisao(quartoHowl);

        System.out.println("\nDivisões atuais no " + casteloAnimado.nome + ":");
        
        for (Divisao d : casteloAnimado.getDivisoes()) {
            System.out.println("- " + d.nome);
        }
    }
}
