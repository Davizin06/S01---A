import java.util.ArrayList;

public class MainExercicio2 {

    public static void main(String[] args) {

        System.out.println("--- Criando os Tipos de Café (Polimorfismo) ---");
        
        Cafe cafeComum = new Cafe("Café da Casa", 8.00);
        Cafe cafeGourmet = new CafeGourmet("Blue Mountain", 15.00, 3.00);

        System.out.println("Preço do " + cafeComum.getNome() + ": R$ " + cafeComum.calcularPrecoFinal());
        System.out.println("Preço do " + cafeGourmet.getNome() + ": R$ " + cafeGourmet.calcularPrecoFinal());

        System.out.println("\n--- Teste de Composição (Cafeteria e Menu) ---");
        
        Menu menuDaCasa = new Menu();
        
        menuDaCasa.adicionarItem(cafeComum);
        menuDaCasa.adicionarItem(cafeGourmet);

        CafeLeblanc cafeteria = new CafeLeblanc(menuDaCasa);

        System.out.println("\n--- Testando Pedidos na Cafeteria ---");
        
        System.out.println("Fazendo pedido do primeiro item do menu...");
        Cafe pedido1 = cafeteria.getMenu().getItens().get(0);
        cafeteria.receberPedido(pedido1);
        
        System.out.println("\nFazendo pedido do segundo item do menu...");
        Cafe pedido2 = cafeteria.getMenu().getItens().get(1);
        cafeteria.receberPedido(pedido2);
    }
}
