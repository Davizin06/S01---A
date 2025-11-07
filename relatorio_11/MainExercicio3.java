public class MainExercicio3 {

    public static void main(String[] args) {

        System.out.println("--- Criando Entidades (Composição e Interface) ---");

        Poder poderFogo = new Poder("Piromancia");
        IRastreavel youkai1 = new Youkai("Kitsune", "Floresta Mística", poderFogo);
        
        IRastreavel alien1 = new Alien("Zorg", "Área 51", "Marte", "Disco Prata");

        System.out.println(youkai1.obterCoordenadas());
        System.out.println(alien1.obterCoordenadas());

        System.out.println("\n--- Testando Registro com HashMap (Unicidade) ---");
        
        RegistroOculto registro = new RegistroOculto("Detetives Ocultos");

        registro.registrarAvistamento(youkai1);
        registro.registrarAvistamento(alien1);

        System.out.println("\n--- Tentando registrar a mesma entidade (Kitsune) ---");
        
        IRastreavel youkaiRepetido = new Youkai("Kitsune", "Templo", new Poder("Ilusão"));
        registro.registrarAvistamento(youkaiRepetido); 

        System.out.println("\n--- Registros Finais ---");
        System.out.println("Total de avistamentos únicos: " + registro.getAvistamentos().size());
        
        for (String nome : registro.getAvistamentos().keySet()) {
            System.out.println("- " + nome);
        }
    }
}
