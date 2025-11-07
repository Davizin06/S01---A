public class BossMagico extends Boss {

    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("O Boss Mágico " + this.nome + " canaliza energia arcana!");
        System.out.println("Ponto Fraco: " + this.pontoFraco);
        System.out.println("Moveset Mágico:");
        for (PadraoAtaque ataque : moveset) {
            System.out.println("- " + ataque.toString());
        }
    }
}
