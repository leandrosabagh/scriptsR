#Estatistica Multivariada, PPG-DIBICT UFAL
#Prof Marcos Vital
#21-08-2017
#Aula 2
##############################################

#Lendo os dados
setwd("D:/R/multivariada 2017")
#Mude o endere�o acima, para o da pasta de trabalho no seu computador

spe<-read.csv("DoubsSpe.csv", row.names=1)  #Dados das esp�cies de peixes
env<-read.csv("DoubsEnv.csv", row.names=1)  #Vari�veis ambientais nos locais de coleta
spa<-read.csv("DoubsSpa.csv", row.names=1)  #Coordenadas dos locais de coleta

#Carregando pacotes:
library(vegan)

#######################################

#Vamos criar um objeto com as vari�veis f�sico-qu�micas da �gua:
fisqui<-env[ , 5:11]

summary(fisqui)

########################################

##Criando um cluster passo a passo
#

#Padroniza��o dos dados (aplique quando necess�rio)
fisqui.pad<-decostand(fisqui, method="standardize")

#Criando a matriz de dist�ncia:
fisqui.pad.euc<-dist(fisqui.pad, method="euclidean")

#Calculando o cluster:
fisqui.pad.euc.clus<-hclust(fisqui.pad.euc, method="average")

#Calculando o coeficiente de correla��o cofen�tica
fisq.pad.euc.coph<-cophenetic(fisqui.pad.euc.clus)
cor(fisqui.pad.euc, fisq.pad.euc.coph)

#Agora sim, vamos olhar o nosso cluster:
plot(fisqui.pad.euc.clus, hang=-1)

#Criando uma nova visualiza��o, desta vez na horizontal:
fisqui.pad.euc.dend<-as.dendrogram(fisqui.pad.euc.clus)
plot(fisqui.pad.euc.dend, horiz=T)

#Plotando em uma janela com dimens�es pr�-determinadas:
windows(width=8, height=8, rescale="fixed")
plot(fisqui.pad.euc.dend, horiz=T)

#####################################################

##
#Trabalhando com os dados das esp�cies

specnumber(spe)

#Vamos remover a linha 8, que n�o tem esp�cies registradas
#Faremos isso apenas para o c�lculo das matrizes de dist�ncia
#Por seguran�a, vou criar um novo objeto:

spe_8<-spe[-8, ]
specnumber(spe_8)

#Antes de come�ar, vamos espiar rapidamente os valores de
#abund�ncia das esp�cies

#Abund�ncia por esp�cie:
abund.sp<-colSums(spe_8)
abund.sp
hist(abund.sp, col="gray")

#Abund�ncia por unidade amostral:
abund.ua<-rowSums(spe_8)
abund.ua
hist(abund.ua, col="gray")

#Vamos seguir sem tranforma��o dos dados

##Calculando o cluster por bray-curtis:
#1 - Neste caso, nao precisamos transformar ou padronizar
#2 - Calcular a matriz:
spe.bray<-vegdist(spe_8, method="bray")
#3 - Calcular o cluster:
spe.bray.clus<-hclust(spe.bray, method="average")
4 - Coeficiente de correla��o cofen�tica:
spe.bray.coph<-cophenetic(spe.bray.clus)
cor(spe.bray.coph, spe.bray)
5 - Agora sim, visualizar o cluster:
spe.bray.dend<-as.dendrogram(spe.bray.clus)
plot(spe.bray.dend, horiz=T)

######

#Se quiser fazer o mesmo com Jaccard, use:
#method="jaccard", binary=T nos argumentos de vegdist
#binary=T � essencial, a n�o ser que os dados j� sejam bin�rios

###################################

##
#Criando um mapa de calor usando a fun��o coldiss (do livro)

#Carregue o pacote necess�rio

#install.packages("gclus")  #Se precisar instalar o pacote, execute isso
library(gclus)

source("coldiss.R")

coldiss(spe.bray)
#O argumento nc determina o n�mero de cores usadas



