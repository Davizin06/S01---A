  20 numero = INT(RND * 101)  
  30 PRINT "Tente adivinhar o número entre 0 e 100:"
  40 INPUT "Qual é o seu palpite? "; palpite
  50 IF palpite = numero THEN PRINT "Parabéns! Você acertou o número."
  55 GOTO 100
  60 IF palpite < numero THEN PRINT "O número correto é maior. Tente novamente."
  70 IF palpite > numero THEN PRINT "O número correto é menor. Tente novamente."
  80 GOTO 40

  100 END
