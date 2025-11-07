public class CafeLeblanc {
    
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("--- Pedido Recebido ---");
        System.out.println("Café: " + cafe.getNome());
        System.out.println("Preço Final: R$ " + cafe.calcularPrecoFinal());
    }

    public Menu getMenu() {
        return menu;
    }
}
