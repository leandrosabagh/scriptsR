#Estatistica Multivariada, PPG-DIBICT UFAL
#Prof Marcos Vital
#22-08-2017
#Aula 3
##############################################

#Lendo os dados
setwd("D:/R/multivariada 2017")
#Mude o endere�o acima, para o da pasta de trabalho no seu computador

spe<-read.csv("DoubsSpe.csv", row.names=1)  #Dados das esp�cies de peixes
env<-read.csv("DoubsEnv.csv", row.names=1)  #Vari�veis ambientais nos locais de coleta
spa<-read.csv("DoubsSpa.csv", row.names=1)  #Coordenadas dos locais de coleta

#Vamos criar um objeto com as vari�veis f�sico-qu�micas da �gua:
fisqui<-env[ , 5:11]

#Dados das esp�cies, sem a unidade amostral 8
spe_8<-spe[-8, ]


#Carregando pacotes:
library(vegan)

#######################################

pca.fisqui<-rda(fisqui, scale=T)

#scale=T garante que vai padronizar (standardization) os dados
#voc� s� n�o precisa deste argumento quando todas as vari�veis tem a mesma unidade

#Mostra os resultados:
summary(pca.fisqui)

#Gr�fico dos dois primeiros componentes:
biplot(pca.fisqui)

#Mostra o objeto com os resultados "por dentro":
str(pca.fisqui)

#Acessando peda�os da pca

pca.fisqui$CA$eig  #Autovalores
pca.fisqui$CA$u    #Coordenadas

#Armazenando os valores dos dois primeiros componentes:
pc1<-pca.fisqui$CA$u[ ,1]
pc2<-pca.fisqui$CA$u[ ,2]

#Um exemplo tosco:
riqueza<-specnumber(spe)

plot(riqueza~pc1)
