import java.util.HashMap;

public class Batalha {
    
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        this.arena.put(boss.getIdBoss(), boss);
        System.out.println("Boss " + boss.getNome() + " (ID: " + boss.getIdBoss() + ") adicionado à arena.");
    }

    public void iniciarBatalha(String idBoss) {
        Boss bossEncontrado = this.arena.get(idBoss);
        
        System.out.println("\n--- BATALHA INICIANDO ---");
        if (bossEncontrado != null) {
            bossEncontrado.iniciarFase();
        } else {
            System.out.println("Erro: Boss com ID " + idBoss + " não encontrado na arena.");
        }
        System.out.println("--- BATALHA CONCLUÍDA ---");
    }
    
    public HashMap<String, Boss> getArena() {
        return arena;
    }
}
