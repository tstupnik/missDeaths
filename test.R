setwd(dir="C:/Users/tomaz/Documents/My Documents/PhD/missDeaths_2.4/missDeaths")
devtools::check()

library(missDeaths)

ratetable = survexp.us
sim = md.simparams() +
  md.sex("sex", 0.5) +
  md.uniform("birth", as.Date("1930-1-1"), as.Date("1960-1-1")) +
  md.uniform("start", as.Date("2005-1-1"), as.Date("2010-1-1")) +
  md.death("death", ratetable, "sex", "birth", "start") +
  md.eval("age", "as.numeric(start-birth) / 365.2425") +
  md.norm("Z1", 100, 15) +
  md.uniform("Z2") +
  md.exp("event", "start", c("age","sex","Z1","Z2"), c(0.1,2,0.01,1), 0.0001)
sample = md.simulate(sim, 1000)
complete = md.censor(sample, "start", as.Date("2015-1-1"), c("event","death"))
observed = complete
dead = which(observed$status == 2)
observed$time[dead] = observed$maxtime[dead]
observed$status[dead] = 0

D = md.D(age=observed$age, sex=observed$sex, year=observed$start)
system.time({
  A=md.survnp(observed$time, observed$status, observed$maxtime, D, ratetable)})
system.time({
  B=md.survnp2(observed$time, observed$status, observed$maxtime, D, ratetable)})
A$surv.net-B$surv.net

























birth = as.Date("1942-1-1") - 200
sim=md.simparams() + md.sex("sex",0.5)+ md.constant("start",as.Date("1990-1-1")) +
  md.constant("birth", birth) + md.death("death",slopop,"sex","birth","start")
sample=md.simulate(sim,100000)
com <- md.censor(sample,"start",as.Date("2002-1-1"),"death")

#survexp izracun
th <- survexp(~1+ratetable(age=start-birth,year=start,sex=sex),data=com,ratetable=slopop,times=(1:10)*365)

#prezivetje v simulaciji
rez <- rep(NA,10)
for(it in 1:10)rez[it] <- sum(com$time>it*365)/nrow(com)
#primerjamo:
plot(1:10,th$surv,ylim=c(0.8,1))
points(1:10,rez,pch=16)









    md.sex("sex",0.5) + 
    md.dateuniform("start",as.Date("1990-1-1"),as.Date("1990-1-1")) +
    md.sample("age", c(30,50), c(.05,.05)) +
    md.eval("birth", "start - (age * 365)") +
    md.death("death", slopop, "sex", "birth", "start")

sim = md.simparams()+
  md.sex("sex",0.5) +
  md.constant("start", as.Date("1990-1-1")) +
  md.sample("birth",c(as.Date("1960-1-1"), as.Date("1940-1-1"))) +
  md.death("death",slopop,"sex","birth","start")
                            
sample=md.simulate(sim, 1000)






sim = md.simparams() +
  md.data(observed, T) + 
  md.dateuniform("startdate", as.Date("2010-1-1"), as.Date("2010-1-1")) +
  md.exp("dateevent", "startdate", c("age", "sex", "elevation", "iq"), c(0.1, 2, 1, 0.01), 0.0001)
data = md.simulate(sim, 1000)
median(as.numeric(data$dateevent - data$startdate)/365)

sim = md.simparams() +
    md.sex("sex", 1) + 
    md.uniform("elevation") +
    md.mvnorm(c("iq", "dummy"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2)) +
    #md.norm("iq", 100, 15) + md.uniform("dummy") +
    md.binom("treatment", 0.5) +
    md.sample("haircut", c(1, 2, 3, 4), c(0.25, 0.25, 0.25, 0.25)) +
    md.dateuniform("birthdate", as.Date("1930-1-1"), as.Date("1960-1-1")) +
    md.dateuniform("startdate", as.Date("2010-1-1"), as.Date("2010-1-1")) +
    md.death("datedeath", slopop, "sex", "birthdate", "startdate") +
    md.death("us.datedeath", survexp.us, "sex", "birthdate", "startdate") +
    md.eval("age", "as.numeric(startdate - birthdate)/365.2425") + 
    md.exp("dateevent", "startdate", c("age", "sex", "elevation", "iq"), c(0.1, 2, 1, 0.01), 0.0001)

data = md.simulate(sim, 10000)
median(as.numeric(data$dateevent - data$startdate)/365)
complete = md.censor(data, "startdate", as.Date("2010-1-1"), c("dateevent", "datedeath"))

observed = complete
observed$time[which(complete$status == 2)] = observed$maxtime[which(complete$status == 2)]
observed$status[which(complete$status == 2)] = 0
control = complete
control$status[which(complete$status == 2)] = 0

D = md.D(age=observed$age, sex=observed$sex, year=observed$startdate)
md.survcox(observed, Surv(time, status) ~ age + sex + iq + elevation, 
           observed$maxtime, D, ratetable, iterations=4, R=1)

np = md.survnp(observed$time, observed$status, observed$maxtime, D, ratetable)
w = list(list(time=np$time, est=np$surv.net, var=(np$std.err.net)^2))
timepoints(w, times=c(3,9)*365.2425)
plot(np$time/365.2425, np$surv.net)
plot(np$time/365.2425, np$surv.efs)





library(missDeaths)
library(foreach)
library(doParallel)
data(slopop)
ratetable = slopop

sim = md.simparams() +
  md.sex("sex", 1) + 
  md.uniform("elevation") +
  md.mvnorm(c("iq", "dummy"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2)) +
  #md.norm("iq", 100, 15) + md.uniform("dummy") +
  md.binom("treatment", 0.5) +
  #md.sample("haircut", c(1, 2, 3, 4), c(0.25, 0.25, 0.25, 0.25)) +
  md.dateuniform("birthdate", as.Date("1930-1-1"), as.Date("1960-1-1")) +
  md.dateuniform("startdate", as.Date("2010-1-1"), as.Date("2010-1-1")) +
  md.death("datedeath", slopop, "sex", "birthdate", "startdate") +
  md.death("us.datedeath", survexp.us, "sex", "birthdate", "startdate") +
  md.eval("age", "as.numeric(startdate - birthdate)/365.2425") + 
  md.exp("dateevent", "startdate", c("age", "sex", "elevation", "iq"), c(0.1, 2, 1, 0.01), 0.0001)

cl <- makeCluster(detectCores() - 4)
registerDoParallel(cl)
getDoParWorkers() 
simulations = foreach(i = 1:10,.combine=rbind) %dopar% {
  library(survival)
  library(rms)
  library(relsurv)
  library(missDeaths)
  
  result = md.simulate(sim, 100)
  result
}
stopCluster(cl)

simulateCombine<-function(a1, a2)
{
  rbind(a1, a2)
}






set.seed(750)
library(missDeaths)
dt = as.Date("1939-12-31")
sim = md.simparams() +
  # Demographic variables:
  md.sex("sex", 2)+
  md.uniform("year", dt, dt) +
  # Times to events:
  md.death("pop.death", slopop, "sex", "year", "year") +
  md.eval("time", "as.numeric(pop.death-year)")+
  md.eval("status", "1")+
  md.eval("age", "0")
data<- md.simulate(sim, 1000)
rs <- rs.surv(Surv(time,status)~1,ratetable = slopop,data=data)
plot(rs,ylim=c(0,2))
abline(h=1,col="red")

mean(data$time)/365.2425

x = survexp(time~1, ratetable=slopop, data=data)




#rs <- rs.surv(Surv(time,status)~1,ratetable = survex, data=data)
#plot(rs,ylim=c(0,2))
#abline(h=1,col="red")


#dt = as.Date("1939-7-1")
dt = as.Date("1939-1-1")
sim = md.simparams() +
  md.eval("sex", "factor('male', levels=c('male', 'female'))") + 
  md.uniform("year", dt, dt) +
  md.death("death", survexp.us, "sex", "year", "year") +
  md.eval("age", "0") +
  md.eval("time", "as.numeric(death-year)")+
  md.eval("status", "1")
data<- md.simulate(sim, 10000)
median(data$time)/365.2425

md.init(slopop)
md.survtime(as.numeric(dt - as.Date("0-1-1"))/365.2425, age=0, prob = 0.5, sex=1)/365.2425

data = data.frame(year = dt, sex = "male", age = 0)
surv = survexp( ~ 1, times=c(0:100*4)*365.2425/4, ratetable=slopop, data=data)
approx(1-surv$surv, surv$time, xout=0.5, method='linear')$y/365.2425


prob = seq(0.000001, 0.999999, by = 0.001)
expsurv = prob
for (i in 1:length(expsurv))
{
  expsurv[i] = md.survtime(as.numeric(dt - as.Date("0-1-1"))/365.2425, age=0, prob = expsurv[i], sex=1)/365.2425
}
plot(expsurv, prob, type = 'l')

k = 0.25
birth = seq(as.Date("1900-1-1"), as.Date("1990-1-1"), by=30)
expsurv2 = expsurv1 = 1:length(birth)
for (i in 1:length(expsurv1))
{
  expsurv1[i] = md.survtime(as.numeric(birth[i] - as.Date("0-1-1"))/365.2425, age=0, prob = k, sex=1)/365.2425

  data = data.frame(year = as.Date(birth[i]), sex = "male", age = 0)
  surv = survexp( ~ 1, times=c(0:100*4)*365.2425/4, ratetable=slopop, data=data)
  expsurv2[i] = approx(1-surv$surv, surv$time, xout=1-k, method='linear')$y/365.2425
}
plot(expsurv1, expsurv2)
plot(birth, expsurv1 - expsurv2, type="l")
abline(h=0,col="red")



dt = as.Date("1990-1-1")
data = data.frame(year = dt, sex = "male", age = 0)
surv = survexp( ~ 1, times=seq(0, 100, by=0.5)*365.2425, ratetable=slopop, data=data)
mdsurv = surv$time
for (i in 1:length(mdsurv))
{
  mdsurv[i] = md.survtime(as.numeric(dt - as.Date("0-1-1"))/365.2425, age=0, prob = surv$surv[i], sex=1)
}
comp = cbind(surv$time, mdsurv)
plot(surv$time - mdsurv)




