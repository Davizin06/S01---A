import java.util.ArrayList;

public class Castelo {

    public String nome;
    
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }
    
    public Castelo(String nome) {
        this.nome = nome;
        // Importante: Inicializa a lista
        this.divisoes = new ArrayList<>();
    }


    public void adicionarDivisao(Divisao divisao) {
        this.divisoes.add(divisao);
        System.out.println("A divisão '" + divisao.nome + "' foi adicionada ao " + this.nome + ".");
    }

    public ArrayList<Divisao> getDivisoes() {
        return this.divisoes;
    }
}
