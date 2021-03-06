#Estatistica Multivariada, PPG-DIBICT UFAL
#Prof Marcos Vital
#25-08-2017
#Aula 5
##############################################

#Lendo os dados
setwd("D:/R/multivariada 2017")
#Mude o endere�o acima, para o da pasta de trabalho no seu computador

spe<-read.csv("DoubsSpe.csv", row.names=1)  #Dados das esp�cies de peixes
env<-read.csv("DoubsEnv.csv", row.names=1)  #Vari�veis ambientais nos locais de coleta
spa<-read.csv("DoubsSpa.csv", row.names=1)  #Coordenadas dos locais de coleta

#Vamos criar um objeto com as vari�veis f�sico-qu�micas da �gua:
fisqui<-env[ , 5:11]

#Dados das esp�cies, das var f�sico-qu�micas e das ambientais, sem a unidade amostral 8
spe_8<-spe[-8, ]
fisqui_8<-fisqui[-8, ]
env_8<-env[-8, ]
spa_8<-spa[-8, ]

#Carregando pacotes:
library(vegan)
#######################################

##
#Teste de Mantel

#Matriz de dist�ncia, dados f�sico-qu�micos:
fisqui.pad<-decostand(fisqui_8, method="standardize")
fisqui.euc<-vegdist(fisqui.pad, method="euclidean")

#Matriz de dist�ncia, dados das esp�cies:
spe.jac<-vegdist(spe_8, method="jaccard", binary=T)

#Matriz de dist�ncia geogr�fica:
spa.euc<-vegdist(spa_8, method="euclidean")

#Executando o mantel:
mantel(fisqui.euc, spe.jac)

#Sheppard plot:
plot(fisqui.euc, spe.jac, pch=16, cex=0.5)

#Mantel parcial:
mantel.partial(fisqui.euc, spe.jac, spa.euc)


########
#Anosim e Permanova (adonis)

#Criando (de novo) uma vair�vel categ�rica:
alt.clas<-ifelse(env_8$alt>600, "alto", "baixo")
alt.clas<-as.factor(alt.clas)


##
#Anosim

resultado.anosim<-anosim(spe.jac, alt.clas)

resultado.anosim

plot(resultado.anosim)

##
#adonis

resultado.adonis<-adonis(spe.jac~alt.clas)

resultado.adonis


###################################

##
#Autocorrelogramas de mantel

jac.spa<-mantel.correlog(spe.jac, spa.euc)

jac.spa
plot(jac.spa)


################################

##
#M�todo dos filtros espaciais

riqueza<-specnumber(spe_8)

#1 - PCA:
spa.pca<-princomp(spa.euc)

#2 - Extrair os filtros:
summary(spa.pca)
filtros<-spa.pca$scores[,1:5]

#3 - Reg. m�ltipla:
resultado.filtros<-lm(riqueza~filtros)

summary(resultado.filtros)

#4 - Pegando os res�duos:
riqueza.res<-resultado.filtros$residuals

#5 - Agora voc� poderia usar a vari�vel com desejado




