SecondaryPhenotype <-
function(x,y,d,z=null,covariates=FALSE,sigLevel=0.05){
    #Check that the significance level is between 0 and 1
    if(sigLevel > 0 && sigLevel < 1){
            #Check that vectors x,y,and d are the same length
            if(length(x)==length(y) && length(y)==length(d) ){
                library(MASS)                       # load library to use polr function
                
                if(covariates==TRUE){
                modelH0<-polr(as.factor(x)~ d+z)    # null hypothesis
                modelH1<-polr(as.factor(x)~ y+d+z)  # alternative hypothesis
                results<-anova(modelH0,modelH1)
                }
                
                if(covariates==FALSE){
                    modelH0<-polr(as.factor(x)~ d)    # null hypothesis
                    modelH1<-polr(as.factor(x)~ y+d)  # alternative hypothesis
                    results<-anova(modelH0,modelH1)
                }

                
                if(results$P[2]>sigLevel){print(paste("The SNP is not associated with the secondary phenotype Y given case-control status (p-value=",results$P[2],").",sep=""))}
                if(results$P[2]<sigLevel){print(paste("The SNP is associated with the secondary phenotype Y given case-control status (p-value=",results$P[2],").",sep=""))}
                list(results)                 		 # Likelihood ratio test
            }else(print("The lengths of the vectors (x,y, and d) are not equal"))
    }else (print("Significance level must be between 0 and 1"))
}
