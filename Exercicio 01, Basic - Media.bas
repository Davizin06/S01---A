10 INPUT "Digite a primeira nota: "; nota1
20 INPUT "Digite a segunda nota: "; nota2
30 media = (VAL(nota1) + VAL(nota2)) / 2
40 IF media > 60 THEN PRINT "Você foi aprovado"
50 IF media < 30 THEN PRINT "Você foi reprovado"
60 IF media <= 60 AND media >= 30 THEN INPUT "Digite a terceira nota: "; nota3
      np3 = (VAL(media) + VAL(nota3)) / 2
70 IF np3 > 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado pela NP3"
