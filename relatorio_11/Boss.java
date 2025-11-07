import java.util.LinkedHashSet;

public class Boss {
    
    protected String nome;
    protected String idBoss;
    protected String pontoFraco;
    protected LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        boolean adicionou = this.moveset.add(ataque);
        if (adicionou) {
            System.out.println(ataque.getNome() + " adicionado ao " + this.nome);
        } else {
            System.out.println(ataque.getNome() + " já existe no moveset.");
        }
    }

    public void iniciarFase() {
        System.out.println("O Boss " + this.nome + " iniciou sua fase padrão!");
        System.out.println("Ponto Fraco: " + this.pontoFraco);
        System.out.println("Moveset:");
        for (PadraoAtaque ataque : moveset) {
            System.out.println("- " + ataque.toString());
        }
    }
    
    public String getNome() {
        return nome;
    }

    public String getIdBoss() {
        return idBoss;
    }
}
