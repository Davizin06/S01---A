function maiorNumero(tabela)
    local maior = tabela[1]
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

local numeros = { 10, 25, 7, 42, 18, 99, 3 }

print("O maior número da tabela é: " .. maiorNumero(numeros))
