{-# LANGUAGE RecordWildCards #-}
import Text.Printf (printf)

data Banda = Banda {
    nomeBanda :: String,
    genero :: String,
    cache :: Double
} deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show, Eq)

data Evento = Evento {
    bandas :: [Banda],
    statusEvento :: StatusEvento
} deriving (Show)

somaCaches :: [Banda] -> Double
somaCaches listaBandas = sum (map cache listaBandas)

custoTotalEvento :: Evento -> Double
custoTotalEvento Evento {..}
    | statusEvento == Cancelado = 0.0
    | otherwise =
        let totalCaches = somaCaches bandas
        in totalCaches + (totalCaches * 0.20)

bandaAbertura :: Evento -> String
bandaAbertura Evento {..} =
    case bandas of
        [] -> "Nenhuma banda no evento"
        (primeira:_) -> nomeBanda primeira

bandaFechamento :: Evento -> String
bandaFechamento Evento {..} =
    case bandas of
        [] -> "Nenhuma banda no evento"
        _  -> nomeBanda (last bandas)

main :: IO ()
main = do
    putStrLn "--- Questão 3: Casa de Shows ---"
    
    let banda1 = Banda "Radiohead" "Rock Alternativo" 50000.0
    let banda2 = Banda "Aphex Twin" "IDM" 30000.0
    let banda3 = Banda "The Smiths" "Indie" 40000.0

    let eventoAtivo = Evento [banda1, banda2, banda3] Ativo
    let eventoEncerrado = Evento [banda3] Encerrado
    let eventoCancelado = Evento [banda1] Cancelado

    putStrLn "Evento Ativo:"
    putStrLn ("   Abertura: " ++ bandaAbertura eventoAtivo)
    putStrLn ("   Fechamento: " ++ bandaFechamento eventoAtivo)
    printf "   Custo Total: R$%.2f\n" (custoTotalEvento eventoAtivo)

    putStrLn "Evento Encerrado:"
    putStrLn ("   Abertura: " ++ bandaAbertura eventoEncerrado)
    printf "   Custo Total: R$%.2f\n" (custoTotalEvento eventoEncerrado)

    putStrLn "Evento Cancelado:"
    putStrLn ("   Abertura: " ++ bandaAbertura eventoCancelado)
    printf "   Custo Total: R$%.2f\n" (custoTotalEvento eventoCancelado)
