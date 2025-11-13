{-# LANGUAGE RecordWildCards #-}
import Text.Printf (printf)

data Item = Item {
    nomeItem :: String,
    categoria :: String,
    precoItem :: Double
} deriving (Show)

data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show)

totalItens :: [Item] -> Double
totalItens listaItens = sum (map precoItem listaItens)

valorFinal :: CompraZelda -> Double
valorFinal CompraZelda {..} =
    let total = totalItens itens
    in
        | total > 200 = total * 0.90
        | otherwise = total + 15.0

main :: IO ()
main = do
    putStrLn "--- Questão 2: Lojas de Hyrule ---"

    let masterSword = Item "Master Sword" "Arma" 150.0
    let hylianShield = Item "Hylian Shield" "Equipamento" 80.0
    let redPotion = Item "Red Potion" "Poção" 20.0

    let compra1 = CompraZelda [masterSword, hylianShield]
    let compra2 = CompraZelda [redPotion, redPotion]

    putStrLn "Compra 1 (Itens: Master Sword, Hylian Shield)"
    printf "   Valor Final: R$%.2f\n" (valorFinal compra1)

    putStrLn "Compra 2 (Itens: 2x Red Potion)"
    printf "   Valor Final: R$%.2f\n" (valorFinal compra2)
