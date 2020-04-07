#Set working directory 							
setwd("~/Desktop/Honour R/CREATING DATA FRAME")							
							
#packages install (if have not already installed)							
install.packages("dplyr")							
							
if (packageVersion("devtools") < 1.6) {							
  install.packages("devtools")							
}							
devtools::install_github("hadley/lazyeval")							
devtools::install_github("hadley/dplyr")							
							
install.packages("caret", dependencies = TRUE)							
install.packages("devtools")							
install.packages("ggplot2")							
install.packages("randomForest")							
install.packages("e1071")							
install.packages("mlbench")							
install.packages("PresenceAbsence")							
							
							
library(devtools)							
library(dplyr)							
library(ggplot2)							
library(e1071)							
library(mlbench)							
library(caret)							
library(randomForest)							
library(PresenceAbsence)							
														
#Loading in and naming individual Towsey.Acoustic.csv files with corresponding pw detections							
file1_ACI=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.ACI.csv",TRUE,",")							
file1_BGN=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.BGN.csv",TRUE,",")							
file1_CVR=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.CVR.csv",TRUE,",")							
file1_DIF=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.DIF.csv",TRUE,",")							
file1_ENT=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.ENT.csv",TRUE,",")							
file1_EVN=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.EVN.csv",TRUE,",")							
file1_OSC=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.OSC.csv",TRUE,",")							
file1_PMN=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.PMN.csv",TRUE,",")							
file1_R3D=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.R3D.csv",TRUE,",")							
file1_RHZ=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.RHZ.csv",TRUE,",")							
file1_RNG=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.RNG.csv",TRUE,",")							
file1_RPS=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.RPS.csv",TRUE,",")							
file1_RVT=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.RVT.csv",TRUE,",")							
file1_SPT=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.SPT.csv",TRUE,",")							
file1_SUM=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.SUM.csv",TRUE,",")							
file1_Indices=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.Indices.csv",TRUE,",")							
file2_ACI=read.csv("S4A05079_20170916_181202__Towsey.Acoustic.ACI.csv",TRUE,",")							
file2_BGN=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.BGN.csv",TRUE,",")							
file2_CVR=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.CVR.csv",TRUE,",")							
file2_DIF=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.DIF.csv",TRUE,",")							
file2_ENT=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.ENT.csv",TRUE,",")							
file2_EVN=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.EVN.csv",TRUE,",")							
file2_OSC=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.OSC.csv",TRUE,",")							
file2_PMN=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.PMN.csv",TRUE,",")							
file2_R3D=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.R3D.csv",TRUE,",")							
file2_RHZ=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.RHZ.csv",TRUE,",")							
file2_RNG=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.RNG.csv",TRUE,",")							
file2_RPS=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.RPS.csv",TRUE,",")							
file2_RVT=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.RVT.csv",TRUE,",")							
file2_SPT=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.SPT.csv",TRUE,",")							
file2_SUM=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.SUM.csv",TRUE,",")							
file2_Indices=read.csv("S4A05079_20170919_181402__Towsey.Acoustic.Indices.csv",TRUE,",")							

						
							
#cbinding files							
file1_data.frameBGN=cbind(file1_ACI,file1_BGN[,-1])							
file1_data.frameCVR=cbind(file1_data.frameBGN,file1_CVR[,-1])							
file1_data.frameDIF=cbind(file1_data.frameCVR,file1_DIF[,-1])							
file1_data.frameENT=cbind(file1_data.frameDIF,file1_ENT[,-1])							
file1_data.frameEVN=cbind(file1_data.frameENT,file1_EVN[,-1])							
file1_data.frameOSC=cbind(file1_data.frameEVN,file1_OSC[,-1])							
file1_data.framePMN=cbind(file1_data.frameOSC,file1_PMN[,-1])							
file1_data.frameR3D=cbind(file1_data.framePMN,file1_R3D[,-1])							
file1_data.frameRHZ=cbind(file1_data.frameR3D,file1_RHZ[,-1])							
file1_data.frameRNG=cbind(file1_data.frameRHZ,file1_RNG[,-1])							
file1_data.frameRPS=cbind(file1_data.frameRNG,file1_RPS[,-1])							
file1_data.frameRVT=cbind(file1_data.frameRPS,file1_RVT[,-1])							
file1_data.frameSPT=cbind(file1_data.frameRVT,file1_SPT[,-1])							
file1_data.frameSUM=cbind(file1_data.frameSPT,file1_SUM[,-1])							
file1_data.frameCOMPLETE=cbind(file1_data.frameSUM,file1_Indices[,-1])							
file2_data.frameBGN=cbind(file2_ACI,file2_BGN[,-1])							
file2_data.frameCVR=cbind(file2_data.frameBGN,file2_CVR[,-1])							
file2_data.frameDIF=cbind(file2_data.frameCVR,file2_DIF[,-1])							
file2_data.frameENT=cbind(file2_data.frameDIF,file2_ENT[,-1])							
file2_data.frameEVN=cbind(file2_data.frameENT,file2_EVN[,-1])							
file2_data.frameOSC=cbind(file2_data.frameEVN,file2_OSC[,-1])							
file2_data.framePMN=cbind(file2_data.frameOSC,file2_PMN[,-1])							
file2_data.frameR3D=cbind(file2_data.framePMN,file2_R3D[,-1])							
file2_data.frameRHZ=cbind(file2_data.frameR3D,file2_RHZ[,-1])							
file2_data.frameRNG=cbind(file2_data.frameRHZ,file2_RNG[,-1])							
file2_data.frameRPS=cbind(file2_data.frameRNG,file2_RPS[,-1])							
file2_data.frameRVT=cbind(file2_data.frameRPS,file2_RVT[,-1])							
file2_data.frameSPT=cbind(file2_data.frameRVT,file2_SPT[,-1])							
file2_data.frameSUM=cbind(file2_data.frameSPT,file2_SUM[,-1])							
file2_data.frameCOMPLETE=cbind(file2_data.frameSUM,file2_Indices[,-1])							
							
#rbinding acoustic indices values for all files together into one data frame							
RBIND2=rbind(file1_data.frameCOMPLETE,file2_data.frameCOMPLETE)							

#load in and attach training file to total data frame							
RBIND2_train<-read.csv("RBIND2_train.csv",FALSE,",")							
RBIND2.FILE=cbind(RBIND2_train[,1],RBIND2)							
RBIND2.PW=cbind(RBIND2.FILE,RBIND2_train[,3])							

#name file, minutes and training columns of data frame							
names(RBIND2.PW)[1]<-paste("file_nUMBER")							
names(RBIND2.PW)[2]<-paste("minute")							
names(RBIND2.PW)[3869]<-paste("Plains_wanderer")							
RBIND2.PW[,3869]							

#generating indices names and character strings							
#set nscalar and nIndices							
nscalar<-256							
nIndices<-26							
#naming ACI							
prefixACI <- "ACI"							
suffixACI<-seq(1:nscalar)							
my.namesACI<-c(paste(prefixACI,suffixACI,sep=""))							
my.namesACI							
#naming BGN							
prefixBGN<-"BGN"							
suffixBGN<-seq(1:nscalar)							
my.namesBGN<-c(paste(prefixBGN,suffixBGN,sep=""))							
my.namesBGN							
#namingCVR							
prefixCVR<-"CVR"							
suffixCVR<-seq(1:nscalar)							
my.namesCVR<-c(paste(prefixCVR,suffixCVR,sep=""))							
my.namesCVR							
#namingDIF							
prefixDIF<-"DIF"							
suffixDIF<-seq(1:nscalar)							
my.namesDIF<-c(paste(prefixDIF,suffixDIF,sep=""))							
my.namesDIF							
#naming ENT							
prefixENT<-"ENT"							
suffixENT<-seq(1:nscalar)							
my.namesENT<-c(paste(prefixENT,suffixENT,sep=""))							
my.namesENT							
#naming EVN							
prefixEVN<-"EVN"							
suffixEVN<-seq(1:nscalar)							
my.namesEVN<-c(paste(prefixEVN,suffixEVN,sep=""))							
my.namesEVN							
#naming OSC							
prefixOSC<-"OSC"							
suffixOSC<-seq(1:nscalar)							
my.namesOSC<-c(paste(prefixOSC,suffixOSC,sep=""))							
my.namesOSC							
#naming PMN							
prefixPMN<-"PMN"							
suffixPMN<-seq(1:nscalar)							
my.namesPMN<-c(paste(prefixPMN,suffixPMN,sep=""))							
my.namesPMN							
#naming R3D							
prefixR3D<-"R3D"							
suffixR3D<-seq(1:nscalar)							
my.namesR3D<-c(paste(prefixR3D,suffixR3D,sep=""))							
my.namesR3D							
#naming RHZ							
prefixRHZ<-"RHZ"							
suffixRHZ<-seq(1:nscalar)							
my.namesRHZ<-c(paste(prefixRHZ,suffixRHZ,sep=""))							
my.namesRHZ							
#naming RNG							
prefixRNG<-"RNG"							
suffixRNG<-seq(1:nscalar)							
my.namesRNG<-c(paste(prefixRNG,suffixRNG,sep=""))							
my.namesRNG							
#naming RPS							
prefixRPS<-"RPS"							
suffixRPS<-seq(1:nscalar)							
my.namesRPS<-c(paste(prefixRPS,suffixRPS,sep=""))							
my.namesRPS							
#namingRVT							
prefixRVT<-"RVT"							
suffixRVT<-seq(1:nscalar)							
my.namesRVT<-c(paste(prefixRVT,suffixRVT,sep=""))							
my.namesRVT							
#naming SPT							
prefixSPT<-"SPT"							
suffixSPT<-seq(1:nscalar)							
my.namesSPT<-c(paste(prefixSPT,suffixSPT,sep=""))							
my.namesSPT							
#naming SUM							
prefixSUM<-"SUM"							
suffixSUM<-seq(1:nscalar)							
my.namesSUM<-c(paste(prefixSUM,suffixSUM,sep=""))							
my.namesSUM							
#naming Indices							
prefixIndices<-"Indices"							
suffixIndices<-seq(1:nIndices)							
my.namesIndices<-c(paste(prefixIndices,suffixIndices,sep=""))							
my.namesIndices							
#joining character strings							
all_names=c(my.namesACI,my.namesBGN,my.namesCVR,my.namesDIF,my.namesENT,my.namesEVN,my.namesOSC,my.namesPMN,my.namesR3D,my.namesRHZ,my.namesRNG,my.namesRPS,my.namesRVT,my.namesSPT,my.namesSUM,my.namesIndices)							
length(all_names)							

#naming indices column headings							
colnames(RBIND2.PW)[3:3868]<-paste(all_names)							

#balancing the ratio of positive and negative instances of target value							
totalinstances<-nrow(RBIND2.PW)							
totalPWinstances<-sum(RBIND2.PW[,3869])							
idealrationumberofinstances<-totalPWinstances*2							
totalnonPWinstances<-totalinstances-totalPWinstances							
excessinstances<-totalnonPWinstances-totalPWinstances							

#balancing the ratio of positive and negative instances of target value							
totalinstances<-nrow(RBIND2.PW)							
totalPWinstances<-sum(RBIND2.PW[,3869])							
idealrationumberofinstances<-totalPWinstances*2							
totalnonPWinstances<-totalinstances-totalPWinstances							
excessinstances<-totalnonPWinstances-totalPWinstances							
whichrowsnonPW<-which(RBIND2.PW$"Plains_wanderer" == 0, arr.ind = TRUE)							
excessremoved<-whichrowsnonPW[1:excessinstances]							

#view values							
totalinstances							
totalPWinstances							
totalnonPWinstances							
idealrationumberofinstances							
excessinstances							
whichrowsnonPW							
excessremoved							

#remove excess instances from complete dataframe for 50:50 ratio							
alldata50<-RBIND2.PW[-excessremoved,]							
nrow(alldata50)  ##should equal idealrationumberofinstances for balanced dataset							
ncol(alldata50)							

#Make data frame for removed instances							
copyofexcessremoved=RBIND2.PW[excessremoved,]							
copyofexcessremoved							

#shuffling data							
set.seed(42)							
#shuffle row indices of dataframe							
rows<-sample(nrow(alldata50))							
#use random vector to reorder dataset							
shuffledalldata50<-alldata50[rows,]							

#Creating train and test split with file names and minutes:w							
set.seed(100)							
percentage_split=0.95							
in_training <- createDataPartition(shuffledalldata50$'Plains_wanderer', p = percentage_split, list = FALSE)							
training_w<- shuffledalldata50[in_training,]							
nrow(training_w) ##should ~ equal percentage_split x nrow(alldata50)							
percentage_split*nrow(alldata50)							
testing_split <- shuffledalldata50[-in_training,]							

##is this part needed? should I just make the test set 							
#Adding in removed non Plains_wanderer minutes (unbalanced test set)							
testing_w<-rbind(testing_split,copyofexcessremoved)							

nrow(training_w)							
nrow(testing_split)							
nrow(shuffledalldata50)							
nrow(copyofexcessremoved)							
nrow(testing_w)	
ncol(testing_w)
ncol(training_w)							
tail(names(training_w))							

#Viewing							
training_w$Plains_wanderer						
testing_w$Plains_wanderer					

#Create training without file names and minutes							
training<-training_w[,c(-1,-2)]							

#Create testing without file names and minutes							
testing<-testing_w[,c(-1,-2)]							

#View headers							
colnames(training)							
colnames(testing)							

#Making syntactically valid names for Random Forest model 							
make.names(training, unique = FALSE, allow_ = TRUE)							
make.names(testing, unique = FALSE, allow_ = TRUE)							

#view Plains_wanderer integers before changing to factors: training and test							
training$Plains_wanderer							
testing$Plains_wanderer							

#changing Plains_wanderer integers to factors: training and test							
training$Plains_wanderer = cut(training$Plains_wanderer,2,labels=c('No','Yes'))							
testing$Plains_wanderer = cut(testing$Plains_wanderer,2,labels=c('No','Yes'))							

#view Plains_wanderer factors after changing from integers: training and test							
training$Plains_wanderer							
testing$Plains_wanderer							

#Check Plains_wanderer class:factor							
class(training$Plains_wanderer)							
class(testing$Plains_wanderer)							

#Save training and testing files							
save(training,file="training.Rdata")							
load(file="training.Rdata")							
save(testing,file="testing.Rdata")							
load(file="testing.Rdata")							

==========================================================================================================							
  MACHINE LEARNING							
==========================================================================================================							
  
#Define the control							
control <- trainControl(method = "cv",							
                          number = 10,							
                          search = "grid")		

===========================
  DEFAULT MODEL
===========================

#Create and run model with default paramters							
set.seed(123)							
training_default <- train(Plains_wanderer~.,							
                          data = training,							
                          method = "rf",							
                          metric = "Accuracy",							
                          trControl = control)							
print(training_default)							

#the algorithm uses 500 trees and tested three different values of mtry: 2, 87 and 3869							
#The final value used for the model was mtry = 2, accuracy = 0.8750000							
#Trying to get a higher accuracy 							

==========================							
  BEST MTRY							
==========================							
  
#search best mtry: test values 1:10							
set.seed(123)							
tuneGrid <- expand.grid(.mtry = c(1:10))							
training_mtry<- train(Plains_wanderer~.,							
                      data = training,							
                      method = "rf",							
                      metric = "Accuracy",							
                      tuneGrid = tuneGrid,							
                      trControl = control, 							
                      importance = TRUE,							
                      nodesize = 14,							
                      ntree = 300)							
print(training_mtry)							

#the final value used for the model was mtry = 4, accuracy = 0.8750000							

plot(training_mtry)							

#store the best value of mtry 							
training_mtry$bestTune$mtry							

#Can store it and use it when need to tune other parameters							
max(training_mtry$results$Accuracy)							

#Output 							
best_mtry <- training_mtry$bestTune$mtry 							
best_mtry 							

==========================							
  BEST MAXNODES							
==========================							
  							
  #Searching best maxnodes: creating loop to evaluate best number of maxnodes							
  store_maxnode <- list()							
tuneGrid <- expand.grid(.mtry = best_mtry)							
for(maxnodes in c(1:10)) {							
  set.seed(123)							
  training_maxnode <- train(Plains_wanderer~.,							
                            data = training,							
                            method = "rf",							
                            metric = "Accuracy",							
                            tuneGrid = tuneGrid,							
                            trControl = control,							
                            importance = TRUE,							
                            nodesize = 14,							
                            maxnodes = maxnodes,							
                            ntree = 300)							
  current_iteration <- toString(maxnodes)							
  store_maxnode[[current_iteration]] <- training_maxnode							
}							
results_mtry <- resamples(store_maxnode)							
summary(results_mtry)							
							
							
==========================							
  BEST NTREE 							
==========================							
  							
  							
  store_maxtrees <- list()							
for (ntree in c(250, 300, 350, 400, 450, 500, 550, 600, 800, 1000, 2000)) {							
  set.seed(123)							
  training_maxtrees <- train(Plains_wanderer~.,							
                       data = training,							
                       method = "rf",							
                       metric = "Accuracy",							
                       tuneGrid = tuneGrid,							
                       trControl = control,							
                       importance = TRUE,							
                       nodesize = 14,							
                       maxnodes = 10,							
                       ntree = ntree)							
  key <- toString(ntree)							
  store_maxtrees[[key]] <- training_maxtrees							
}							
results_tree <- resamples(store_maxtrees)							
summary(results_tree)							
							
  #if see increasing values of accuracy just do 10 at a time 							
  #could lead to over fitting? just try nodesize instead?							
  							
							
======================							
FITTING							
======================							
  							
  training_fit <- train(Plains_wanderer~.,							
                  training,							
                  method = "rf",							
                  metric = "Accuracy",							
                  tuneGrid = tuneGrid,							
                  trControl = control,							
                  importance = TRUE,							
                  nodesize = 14,							
                  ntree = 250,							
                  maxnodes = 5)							
							
training_fit$predicted							
summary(training_fit)							
							
==========================							
  PREDICTING USING MODEL 							
==========================							
  							
#Using model to predict on testing dataset 							
prediction<-predict(training_fit, testing, type="prob")	
print(prediction)
plot(prediction)
							
==========================
EVALUATING MODEL
==========================
#Explore optimal classification threshold
#Confusion matrix 
