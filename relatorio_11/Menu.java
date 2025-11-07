import java.util.ArrayList;

public class Menu {
    
    private ArrayList<Cafe> itens;

    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }
    
    public Menu() {
        this.itens = new ArrayList<>();
    }

    public void adicionarItem(Cafe cafe) {
        this.itens.add(cafe);
        System.out.println(cafe.getNome() + " adicionado ao menu.");
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }
}
