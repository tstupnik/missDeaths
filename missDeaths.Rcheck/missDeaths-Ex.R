pkgname <- "missDeaths"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "missDeaths-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('missDeaths')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("md.binom")
### * md.binom

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.binom
### Title: md.binom
### Aliases: md.binom

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.binom("X", 0.25)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.binom", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.censor")
### * md.censor

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.censor
### Title: Censoring simulated survival data
### Aliases: md.censor

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D   md.sex("sex", 0.5) + 
##D     md.uniform("birth", as.Date("1915-1-1"), as.Date("1930-1-1")) +
##D       md.uniform("start", as.Date("2000-1-1"), as.Date("2005-1-1")) +
##D         md.death("death", survexp.us, "sex", "birth", "start") +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE) + 
##D             md.exp("event", "start", c("age", "sex"), c(0.1, 2), 0.05/365.2425)
##D             
##D data = md.simulate(sim, 1000)
##D complete = md.censor(data, "start", as.Date("2010-1-1"), c("event", "death"))
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.censor", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.constant")
### * md.constant

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.constant
### Title: md.constant
### Aliases: md.constant

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.constant("start", as.Date("1990-1-1")) 
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.constant", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.data")
### * md.data

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.data
### Title: md.data
### Aliases: md.data

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.data(data) 
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.data", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.death")
### * md.death

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.death
### Title: md.death
### Aliases: md.death

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.sex("sex", 0.5) + 
##D      md.uniform("birth", as.Date("1930-1-1"), as.Date("1970-1-1")) +
##D        md.uniform("start", as.Date("2005-1-1"), as.Date("2010-1-1")) +
##D          md.death("death", survexp.us, "sex", "birth", "start") 
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.death", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.eval")
### * md.eval

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.eval
### Title: md.eval
### Aliases: md.eval

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D     md.uniform("birth", as.Date("1915-1-1"), as.Date("1930-1-1")) +
##D       md.uniform("start", as.Date("2000-1-1"), as.Date("2005-1-1")) +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.eval", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.exp")
### * md.exp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.exp
### Title: md.exp
### Aliases: md.exp

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D   md.uniform("X1", 0.5) + 
##D     md.norm("X2") +
##D       md.exp("event", as.Date("1915-1-1"), c("X1", "X2"), c(0.1, 0.2), 0.05/365.2425)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.exp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.impute")
### * md.impute

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.impute
### Title: Correctly impute missing information of possible deaths using
###   population mortality
### Aliases: md.impute

### ** Examples

library(missDeaths)
data(slopop)

data(observed)
observed$time = observed$time*365.2425
D = md.D(age=observed$age*365.2425, sex=observed$sex, year=(observed$year - 1970)*365.2425)
newtimes = md.impute(observed, Surv(time, status) ~ age + sex + iq + elevation, 
  observed$maxtime*365.2425, D, slopop, iterations=4)

#Cumulative incidence function
cif = survfit(Surv(observed$time, observed$status)~1)
cif$surv = 1 - cif$surv
cif$upper = 1 - cif$upper
cif$lower = 1 - cif$lower
plot(cif)

#Net survival (NOTE: std error is slightly underestimated!)
surv.net = survfit(Surv(newtimes, observed$status)~1)
summary(surv.net, times=c(3,9)*365.2425)
plot(surv.net)

#Event free survival (NOTE: std error is slightly underestimated!)
surv.efs = survfit(Surv(newtimes, 1 * (observed$status | (newtimes != observed$time)))~1)
summary(surv.efs, times=c(3,9)*365.2425)
plot(surv.efs)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.impute", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.mvnorm")
### * md.mvnorm

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.mvnorm
### Title: md.mvnorm
### Aliases: md.mvnorm

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.mvnorm(c("X1", "X2"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2))
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.mvnorm", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.norm")
### * md.norm

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.norm
### Title: md.norm
### Aliases: md.norm

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.norm("X", 0, 1) 
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.norm", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.sample")
### * md.sample

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.sample
### Title: md.sample
### Aliases: md.sample

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.sample("X", c(0, 1, 2), c(0.2, 0.3, 0.5)) 
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.sample", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.sex")
### * md.sex

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.sex
### Title: md.sex
### Aliases: md.sex

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.sex("sex", 0.5)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.sex", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.simparams")
### * md.simparams

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.simparams
### Title: md.simparams
### Aliases: md.simparams

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.sex("sex", 0.5) + 
##D    md.uniform("birth", as.Date("1930-1-1"), as.Date("1970-1-1")) +
##D    md.uniform("start", as.Date("2005-1-1"), as.Date("2010-1-1")) +
##D    md.death("death", survexp.us, "sex", "birth", "start") 
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.simparams", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.simulate")
### * md.simulate

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.simulate
### Title: md.simulate
### Aliases: md.simulate

### ** Examples


## Not run: 
##D library(missDeaths)
##D ratetable = survexp.us
##D 
##D sim = md.simparams() +
##D           md.sex("sex", 1) + 
##D           md.uniform("Z1") +
##D           md.mvnorm(c("Z2", "Z3"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2)) +
##D           md.sample("Z4", c(1, 2, 3, 4), c(0.25, 0.25, 0.25, 0.25)) +
##D           md.uniform("birth", as.Date("1930-1-1"), as.Date("1970-1-1")) +
##D           md.constant("start", as.Date("1990-1-1")) +
##D           md.death("death", ratetable, "sex", "birth", "start") +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE) + 
##D           md.exp("event", "start", c("age", "sex", "Z1", "Z2"), 
##D              c(0.1, 2, 1, 0.01), 0.0001)
##D           
##D data = md.simulate(sim, 1000)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.simulate", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.survcox")
### * md.survcox

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.survcox
### Title: Fit a proportional hazards regression model over disease
###   recurrence data with missing information of possible deaths
### Aliases: md.survcox

### ** Examples


## Not run: 
##D library(missDeaths)
##D data(slopop)
##D 
##D data(observed)
##D observed$time = observed$time*365.2425
##D D = md.D(age=observed$age*365.2425, sex=observed$sex, year=(observed$year - 1970)*365.2425)
##D 
##D #fit a cox model (NOTE: estimated std error is slightly underestimated!)
##D md.survcox(observed, Surv(time, status) ~ age + sex + iq + elevation, 
##D   observed$maxtime*365.2425, D, slopop, iterations=4, R=1)
##D 
##D #multiple imputations to correct the stimated std error
##D md.survcox(observed, Surv(time, status) ~ age + sex + iq + elevation, 
##D   observed$maxtime*365.2425, D, slopop, iterations=4, R=50)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.survcox", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.survnp")
### * md.survnp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.survnp
### Title: Nonparametric analysis of disease recurrence with missing
###   information of possible deaths
### Aliases: md.survnp

### ** Examples


## Not run: 
##D library(missDeaths)
##D library(cmprsk)
##D data(slopop)
##D 
##D data(observed)
##D D = md.D(age=observed$age*365.2425, sex=observed$sex, year=(observed$year - 1970)*365.2425)
##D np = md.survnp(observed$time*365.2425, observed$status, observed$maxtime*365.2425, D, slopop)
##D 
##D #calculate net survival at 3 and 9 years
##D w = list(list(time=np$time, est=np$surv.net, var=(np$std.err.net)^2))
##D timepoints(w, times=c(3,9)*365.2425)
##D 
##D #plot the net and event free survival curves
##D plot(np$time, np$surv.net)
##D plot(np$time, np$surv.efs)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.survnp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("md.uniform")
### * md.uniform

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: md.uniform
### Title: md.uniform
### Aliases: md.uniform

### ** Examples


## Not run: 
##D library(missDeaths)
##D 
##D sim = md.simparams() +
##D    md.uniform("X", 0, 1)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("md.uniform", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("missDeaths")
### * missDeaths

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: missDeaths
### Title: Simulating and analyzing time to event data in the presence of
###   population mortality
### Aliases: missDeaths missDeaths-package

### ** Examples

## Not run: 
##D library(missDeaths)
##D ratetable = survexp.us
##D 
##D sim = md.simparams() +
##D           md.sex("sex", 0.5) + 
##D           md.binom("Z1", 0.5) +
##D           md.mvnorm(c("Z2", "Z3"), c(100, 0), matrix(c(225, 3, 2, 1), 2, 2)) +
##D           md.sample("Z4", c(1, 2, 3, 4), c(0.25, 0.25, 0.25, 0.25)) +
##D           md.uniform("birth", as.Date("1925-1-1"), as.Date("1950-1-1")) +
##D           md.uniform("start", as.Date("2000-1-1"), as.Date("2005-1-1")) +
##D           md.death("death", ratetable, "sex", "birth", "start") +
##D           md.eval("age", "as.numeric(start - birth)/365.2425", 80, FALSE) + 
##D           md.exp("event", "start", c("age", "sex", "Z1", "Z2"), 
##D              c(0.1, 2, 1, 0.01), 0.05/365.2425)
##D data = md.simulate(sim, 1000)
##D           
##D #construct a complete right censored data set
##D complete = md.censor(data, "start", as.Date("2010-1-1"), c("event", "death"))
##D 
##D #construct an observed right censored data set with non-reported deaths
##D observed = complete
##D observed$time[which(complete$status == 2)] = observed$maxtime[which(complete$status == 2)]
##D observed$status[which(complete$status == 2)] = 0
##D 
##D #estimate coefficients of the proportional hazards model
##D D = md.D(age=observed$age, sex=observed$sex, year=observed$start)
##D md.survcox(observed, Surv(time, status) ~ age + sex + Z1 + Z2, 
##D           observed$maxtime, D, ratetable, iterations=4, R=50)
##D           
##D #estimate net- and event-free survival
##D np = md.survnp(observed$time, observed$status, observed$maxtime, D, ratetable)
##D w = list(list(time=np$time, est=np$surv.net, var=(np$std.err.net)^2))
##D timepoints(w, times=c(3,9)*365.2425)
##D plot(np$time/365.2425, np$surv.net)
##D plot(np$time/365.2425, np$surv.efs)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("missDeaths", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
