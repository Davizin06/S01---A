print("Digite o valor do inicio do intervalo:")
local M = tonumber(io.read())

print("Digite o valor do fim do intervalo:")
local N = tonumber(io.read())

print("Digite um valor X:")
local X = tonumber(io.read())

for i = M, N do
    if i % X == 0 then
        print(i)
    end
end
