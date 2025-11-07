import java.util.ArrayList;

public class Castelo {

    // Atributo público, conforme diagrama [cite: 104]
    public String nome;
    
    // Atributo privado para a lista de divisões [cite: 106]
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }
    
    /**
     * Construtor alternativo para criar um castelo
     * e inicializar sua lista de divisões vazia.
     */
    public Castelo(String nome) {
        this.nome = nome;
        // Importante: Inicializa a lista
        this.divisoes = new ArrayList<>();
    }

    /**
     * Requisito 4: Implementa o método adicionarDivisao [cite: 92]
     */
    public void adicionarDivisao(Divisao divisao) {
        this.divisoes.add(divisao);
        System.out.println("A divisão '" + divisao.nome + "' foi adicionada ao " + this.nome + ".");
    }

    public ArrayList<Divisao> getDivisoes() {
        return this.divisoes;
    }
}
