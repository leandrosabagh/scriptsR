######################################
#Script 7 de bioestat�stica###########
#ANOVA################################
#Prof Marcos Vital UFAL###############
#24-04-2017###########################
######################################

#Hoje vamos ler os dados direto da internet!!!!
#Eles v�o sair daqui:
https://github.com/marcosvital

##Lendo o arquivo:

arquivo<-"https://raw.githubusercontent.com/marcosvital/scriptsR/master/BioestatisticaUFAL/peixes.txt"
dados<-read.table(arquivo, header=T) 	
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 


#Se n�o der certo, volte ao meio tradicional:
dados<-read.table(file.choose(), header=T)  #Abra o arquivo peixes.txt	
summary(dados)								   #Aqui conferimos os dados
attach(dados)								   #Aqui fazemos o R reconhecer as colunas 
############################################################################

##ANOVA

resultado<-aov(Densidade~Predador)   #Realiza o teste
summary(resultado)                   #Mostra o resultado

#Gr�fico:
library(sciplot)

lineplot.CI(Predador, Densidade, type="p")

#O gr�fico, mais bonitinho:
Predador<-relevel(Predador, "Nenhum")

lineplot.CI(Predador, Densidade, type="p", las=1,
xlab="Predador", ylab="Densidade de anf�bios")
