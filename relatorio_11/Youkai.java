public class Youkai implements IRastreavel {
    
    private String nome;
    private String localizacao;
    private Poder poder;

    public Youkai(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return "[Youkai] " + this.nome + " está em " + this.localizacao;
    }
    
    @Override
    public String getNome() {
        return this.nome;
    }

    public Poder getPoder() {
        return poder;
    }
}
