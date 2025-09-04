function filtrarPares(tabela)
    local pares = {}  
    for i = 1, #tabela do
        if tabela[i] % 2 == 0 then
            table.insert(pares, tabela[i]) 
        end
    end
    return pares
end

local numeros = {10, 25, 7, 42, 18, 99, 3, 50}

local apenasPares = filtrarPares(numeros)

print("Números pares encontrados:")
for i = 1, #apenasPares do
    print(apenasPares[i])
end
