public class Alien implements IRastreavel {
    
    private String nome;
    private String localizacao;
    private String planetaOrigem;
    private String Ovni;

    public Alien(String nome, String localizacao, String planetaOrigem, String Ovni) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.planetaOrigem = planetaOrigem;
        this.Ovni = Ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "[Alien] " + this.nome + " está em " + this.localizacao;
    }
    
    @Override
    public String getNome() {
        return this.nome;
    }

    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public String getOvni() {
        return Ovni;
    }
}
