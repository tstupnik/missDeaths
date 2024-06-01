setwd(dir="C:/Users/tomaz/Documents/PhD/missDeaths_2.7")
#devtools::check()
#Sys.which("make")

detach("package:missDeaths", unload=TRUE)
#remove.packages("missDeaths", lib="~/R/win-library/4.0")
#install.packages("c:\\users\\tomaz\\Documents\\PhD\\missdeaths_2.7\\missDeaths_2.7.tar.gz", repos = NULL, type="source")



library(missDeaths)
md.init(survexp.us)


dt = as.Date("1940-1-1")
mdsurv = md.survdump(year = as.numeric(format(dt,'%Y')), sex=1)

data = data.frame(year = as.numeric(dt), sex = "male", age = 0)
surv = survexp( ~ 1, times=mdsurv$times, ratetable=survexp.us, data=data)
mdsurv$surv - surv$surv



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
