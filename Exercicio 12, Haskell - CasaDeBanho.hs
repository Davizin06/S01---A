{-# LANGUAGE RecordWildCards #-}
import Text.Printf (printf)

data Servico = Servico {
    nomeServico :: String,
    tipoServico :: String,
    precoBase :: Double
} deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado deriving (Show, Eq)

data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAtendimento :: StatusAtendimento
} deriving (Show)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual listaServicos =
    let totalBase = sum (map precoBase listaServicos)

        totalComBonus
            | length listaServicos > 3 = totalBase * 1.25
            | otherwise = totalBase

        totalFinal
            | totalComBonus > 500 = totalComBonus * 0.90
            | otherwise = totalComBonus
    in totalFinal

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento Atendimento {..}
    | statusAtendimento == Cancelado = 0.0
    | otherwise = bonusEspiritual servicos

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico Atendimento {..} =
    case servicos of
        [] -> "Nenhum serviço no atendimento"
        (primeiro:_) -> "Nome: " ++ nomeServico primeiro ++ ", Tipo: "++ tipoServico primeiro

main :: IO ()
main = do
    putStrLn "--- Questão 4: Casa de Banhos ---"

    let banhoErvas = Servico "Banho de Ervas" "Banho" 50.0
    let massagemPedras = Servico "Massagem" "Massagem" 150.0
    let banqueteLuxo = Servico "Banquete" "Banquete" 300.0
    let banhoSimples = Servico "Banho Simples" "Banho" 20.0
    let sauna = Servico "Sauna" "Banho" 100.0

    let atendimento1 = Atendimento [banhoErvas] Finalizado
    let atendimento2 = Atendimento [banhoErvas, massagemPedras, banqueteLuxo, banhoSimples] EmAndamento
    let atendimento3 = Atendimento [banqueteLuxo] Cancelado
    let atendimento4 = Atendimento [massagemPedras, banqueteLuxo, sauna] Finalizado

    putStrLn ("Atendimento 1: " ++ descricaoPrimeiroServico atendimento1)
    printf "   Valor Final: R$%.2f\n" (valorFinalAtendimento atendimento1)

    putStrLn ("Atendimento 2: " ++ descricaoPrimeiroServico atendimento2)
    printf "   Valor Final: R$%.2f\n" (valorFinalAtendimento atendimento2)

    putStrLn ("Atendimento 3: " ++ descricaoPrimeiroServico atendimento3)
    printf "   Valor Final: R$%.2f\n" (valorFinalAtendimento atendimento3)
    
    putStrLn ("Atendimento 4: " ++ descricaoPrimeiroServico atendimento4)
    printf "   Valor Final: R$%.2f\n" (valorFinalAtendimento atendimento4)
