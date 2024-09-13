setwd(dir="~/Documents/R/missDeaths/")
system("bash rebuild.sh")
#devtools::check()
#Sys.which("make")

detach("package:missDeaths", unload=TRUE)
remove.packages("missDeaths", lib="~/R/win-library/4.0")
install.packages("~/Documents/R/missDeaths/missDeaths_2.8.tar.gz", repos = NULL, type="source")

sp2 = slopop
sex = 1
sp2[,,] <- 0.0000125# 0.000001

library(missDeaths)
md.init(sp2)#survexp.us)


dt = as.Date("1990-1-1")
mdsurv = md.survdump(year = as.numeric(format(dt,'%Y')), sex=sex)

data = data.frame(year = as.numeric(dt), sex = sex, age = 0)
surv = survexp( ~ 1, times=mdsurv$times, ratetable=sp2, data=data)
mdsurv$surv - surv$surv

sp2[,,] <- 0.0000125
md.init(sp2)
md.survtime(2000, 10, 0.5, sex)/365.24


set.seed(710)
library(missDeaths)
sim = md.simparams() +
  # Demographic variables:
  md.eval("sex", "factor('female', levels=c('male', 'female'))")+
  md.uniform("year", as.Date("1948-01-01"), as.Date("1948-12-31")) +
  # Times to events:
  md.death("pop.death", slopop, "sex", "year","year") +
  md.eval("time", "as.numeric(pop.death-year)")+
  md.eval("status", "1")+
  md.eval("age", "0")
data<- md.simulate(sim, 10000)
rs <- rs.surv(Surv(time,status)~1,ratetable = slopop,data=data)
plot(rs,ylim=c(0,2))
abline(h=1,col="red")
