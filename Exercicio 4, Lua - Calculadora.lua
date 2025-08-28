function calculadora(a, b, operador)
if operador == "+" then
    return a + b
elseif operador == "-" then
    return a - b
elseif operador == "*" then
    return a * b
elseif operador == "/" then
    if b ~= 0 then
        return a / b
    else
        return "Erro: divisão por zero não é permitida."
    end
else
    return "Erro: operador inválido!"
    end
end

print("5 + 3 = " .. calculadora(5, 3, "+"))
print("10 - 4 = " .. calculadora(10, 4, "-"))
print("6 * 7 = " .. calculadora(6, 7, "*"))
print("20 / 4 = " .. calculadora(20, 4, "/"))
print("10 / 0 = " .. calculadora(10, 0, "/"))
print("8 ^ 2 = " .. calculadora(8, 2, "^")) 
