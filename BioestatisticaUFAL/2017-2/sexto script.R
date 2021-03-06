########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 6, Regress�o linear simples    #
#Marcos Vital                          #
########################################

###Lendo dados no R

##Etapa 1 - Determinar a pasta de trabalho:
setwd("D:/Documentos/Bioestatistica 2017-2")

#Conferindo os arquivos da pasta:
dir()

##Etapa 2 - Lendo o arquivo desejado
dados<-read.table("pratica1.txt", header=T)

#Conferindo o objeto criado:
summary(dados)

##############################################

#Cria o modelo de regress�o:
resultado<-lm(dados$Riqueza~dados$�rea)

#Mostra o resultado
summary(resultado)

#O gr�fico:
plot(dados$Riqueza~dados$�rea)
abline(resultado)

#O gr�fico, vers�o fofinha:
plot(dados$Riqueza~dados$�rea, pch=16, las=1,
xlab="�rea do fragmento", ylab="N�mero de esp�cies")
abline(resultado, lty=2, col="red")








