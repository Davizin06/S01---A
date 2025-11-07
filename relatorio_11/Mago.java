public class Mago extends Personagem {

    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String lancarFeitico() {
        return getNome() + " está lançando um feitiço de " + this.magia + "!";
    }

    public String getMagia() {
        return magia;
    }

    public void setMagia(String magia) {
        this.magia = magia;
    }
}
