## Secondary Phenotype
The SecondaryPhenotype R package uses proportional odds logistic regression to test for the association between a SNP (i.e. x) and secondary phenotype (i.e. y) while accounting for the ascertainment bias due to case-control sampling (i.e. d).
#### Installation
```
install.packages("devtools") # devtools must be installed first

devtools::install_github("SharonLutz/SecondaryPhenotype")
```
#### Example
For the given dataset dataSP, one can test if the SNP (i.e. x) is associated with the normally distributed secondary phenotype (i.e. y) given the case-control sampling (i.e. d)  and adjusting for a covariate (i.e. z). The code below runs this analysis.
```
library(SecondaryPhenotype)
?SecondaryPhenotype # For details on how to use the function

data("dataSP")
x <- dataSP[,"x"]
y <- dataSP[,"y"]
d <- dataSP[,"d"]
z <- dataSP[,"z"]
SecondaryPhenotype(x,y,d,z,covariates=TRUE)
```

#### Output
For this analysis, the SNP (i.e. x) is associated with the secondary phenotype (i.e. y) given the case-control sampling (i.e. d).

```
[1] "The SNP is associated with the secondary phenotype Y given case-control status (p-value=0.00016172135463588)."
[[1]]
Likelihood ratio tests of ordinal regression models

Response: as.factor(x)
      Model Resid. df Resid. Dev   Test    Df LR stat.      Pr(Chi)
1     d + z       996    1885.27                                   
2 y + d + z       995    1871.04 1 vs 2     1 14.23058 0.0001617214
```

#### Reference
**Lutz SM**, Hokanson JE, Lange C. (2014) An Alternative Hypothesis Testing Strategy for Secondary Phenotype Data in Case-Control Genetic Association Studies. *Frontiers in Genetics*. 5 (188).


