public class MainExercicio4 {

    public static void main(String[] args) {

        System.out.println("--- Criando Ataques e Bosses ---");
        
        PadraoAtaque ataqueFogo = new PadraoAtaque("Bola de Fogo", 100);
        PadraoAtaque ataqueGelo = new PadraoAtaque("Lança de Gelo", 120);
        PadraoAtaque ataqueFisico = new PadraoAtaque("Investida", 80);

        Boss bossComum = new Boss("Guardião de Pedra", "B01", "Água");
        bossComum.adicionarAtaque(ataqueFisico);
        bossComum.adicionarAtaque(ataqueFisico); // Testando duplicado

        BossMagico bossMagico = new BossMagico("Arquimago", "B02", "Silêncio");
        bossMagico.adicionarAtaque(ataqueFogo);
        bossMagico.adicionarAtaque(ataqueGelo);

        System.out.println("\n--- Configurando a Batalha (HashMap) ---");
        
        Batalha arenaFinal = new Batalha();
        arenaFinal.adicionarBoss(bossComum);
        arenaFinal.adicionarBoss(bossMagico);

        System.out.println("\n--- Teste de Batalha (Polimorfismo) ---");
        
        arenaFinal.iniciarBatalha("B01");
        
        arenaFinal.iniciarBatalha("B02");
        
        arenaFinal.iniciarBatalha("B03");
    }
}
