########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 4, gr�ficos e mais gr�ficos    #
#Marcos Vital                          #
########################################

###Lendo dados no R

##Etapa 1 - Determinar a pasta de trabalho:
setwd("C:/Users/Aluno/Documents/Bioestatistica 2017-2")

#Conferindo os arquivos da pasta:
dir()

##Etapa 2 - Lendo o arquivo desejado
dados<-read.table("pratica1.txt", header=T)

#Conferindo o objeto criado:
summary(dados)

##############################################

##
#Histogramas!

hist(dados$Riqueza)   #Comando b�sico

#Melhorando o histograma:

hist(dados$Riqueza, col="pink", las=1, main=" ", 
xlab="N�mero de esp�cies", ylab="Frequ�ncia")











