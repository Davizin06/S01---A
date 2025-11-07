import java.util.HashMap;

public class RegistroOculto {
    
    private String nomeEquipe;
    private HashMap<String, IRastreavel> avistamentos;

    public RegistroOculto(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(IRastreavel entidade) {
        String nomeEntidade = entidade.getNome();
        
        if (avistamentos.containsKey(nomeEntidade)) {
            System.out.println("Falha: " + nomeEntidade + " já foi registrado.");
            return false;
        } else {
            avistamentos.put(nomeEntidade, entidade);
            System.out.println("Sucesso: " + nomeEntidade + " registrado por " + this.nomeEquipe);
            return true;
        }
    }
    
    public HashMap<String, IRastreavel> getAvistamentos() {
        return avistamentos;
    }
}
