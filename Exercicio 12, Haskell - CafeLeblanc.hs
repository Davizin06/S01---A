{-# LANGUAGE RecordWildCards #-}
import Text.Printf (printf)

data Bebida = Bebida {
    nomeBebida :: String,
    tipoBebida :: String,
    preco :: Double
} deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado deriving (Show, Eq)

data Pedido = Pedido {
    bebidas :: [Bebida],
    status :: StatusPedido
} deriving (Show)

somaPrecos :: [Bebida] -> Double
somaPrecos listaBebidas = sum (map preco listaBebidas)

valorTotalPedido :: Pedido -> Double
valorTotalPedido Pedido {..}
    | status == Cancelado = 0.0
    | otherwise = somaPrecos bebidas + 5.00

primeiraBebida :: Pedido -> String
primeiraBebida Pedido {..} =
    case bebidas of
        [] -> "Pedido vazio"
        (primeira:_) -> nomeBebida primeira

main :: IO ()
main = do
    putStrLn "--- Questão 1: Café Leblanc ---"
    
    let cafe = Bebida "Café" "Café" 8.00
    let cha = Bebida "Chá" "Chá" 6.00
    let suco = Bebida "Suco" "Suco" 7.00

    let pedido1 = Pedido [cafe, suco] Aberto
    let pedido2 = Pedido [cha] Cancelado
    let pedido3 = Pedido [] Entregue

    putStrLn ("Pedido 1 (Aberto): " ++ primeiraBebida pedido1)
    printf "   Valor Total: R$%.2f\n" (valorTotalPedido pedido1)

    putStrLn ("Pedido 2 (Cancelado): " ++ primeiraBebida pedido2)
    printf "   Valor Total: R$%.2f\n" (valorTotalPedido pedido2)

    putStrLn ("Pedido 3 (Vazio): " ++ primeiraBebida pedido3)
    printf "   Valor Total: R$%.2f\n" (valorTotalPedido pedido3)
