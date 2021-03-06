## ------------------------------------------------------------------------
library(fastman)

# This code is used to generate test dataset.
chr_base <- c(0, 249250621, 492449994, 690472424, 881626700, 1062541960, 1233657027, 1392795690, 1539159712, 1680373143, 1815907890, 1950914406, 2084766301, 2199936179, 2307285719, 2409817111, 2500171864, 2581367074, 2659444322, 2718573305, 2781598825, 2829728720, 2881033286, 3036303846, 3095677412)

set.seed(1)
testdata <- data.frame()
gws_chr <- round(runif(1,1,24))
i <- 1
while(i<length(chr_base)){
    n1 <- chr_base[i+1] - chr_base[i]
    bp <- seq(1,n1,1e4)
    n2 <- length(bp)
    p <- c(runif(n2))
    if(i == gws_chr){
        # divisor is adapted from the qqman package 
        divisor <- c(seq(2,50,2), seq(50,2,-2))
        divisor <- divisor^4
        length(divisor)
        p[151:200] <- p[151:200]/divisor
    }
    d <- data.frame(CHR=rep(i, n2), BP=bp,P=p)
    testdata <- rbind(testdata, d)            
    i <- i + 1
}
save(testdata,file = "../data/testdata.RData", compress = "xz", compression_level = 9)

## ------------------------------------------------------------------------
fastman(testdata)

## ------------------------------------------------------------------------
fastman(testdata, color=c("blue","green"))

## ------------------------------------------------------------------------
fastman(testdata, color=c("blue","green"), yscale = 8)

## ------------------------------------------------------------------------
fastman(testdata, color=c("blue","green"), yscale = 8, turbo = TRUE)

## ------------------------------------------------------------------------
fastqq(testdata)

