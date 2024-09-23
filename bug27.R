library(dplyr)
library(relsurv)
library(missDeaths)

# 1. Vzamemo enostaven ratetable, kjer je pop hazard konstanten:
sp2 <- slopop
yr <- "1990"
sp2[,,] <- slopop["0",yr,"female"]

times = (0:100)*365
data = data.frame(age=10,year=2000,sex=1)
survexp(~1, data, times=times, conditional=T, ratetable=sp2, method="ederer")

# 2. Generiramo podatke:
sim <- md.simparams() +
  md.sex("sex", 0) + # samo female
  md.uniform("date_birth", as.Date(paste0(yr, "-01-01")), as.Date(paste0(yr, "-01-01"))) +
  md.death("date_death_other", sp2, "sex", "date_birth", "date_birth") + # spremljamo jih od casa 0 (birth)
  md.eval("age_death_other","as.numeric(date_death_other-date_birth)/365.241") +
  md.eval("status", "1")

set.seed(808)
data <- md.simulate(sim, 10000)
# Tole naredimo, ker se pojavijo negativni casi spremljanja:
data <- data %>%
  filter(age_death_other>0)

# 3. Fittamo model:
mod <- survfit(Surv(age_death_other, status) ~ 1, data)
plot(mod, conf.int = FALSE)

# 4. Rocno izracunamo pricakovano prezivetje:
xx <- mod$time
lines(xx, exp(-xx*365.241*sp2[1,1,1]), col='green', type='s')

# Dobimo zelo razlicni prezivetji.
# Vendar, ce nastavimo yr = 1930, 1948, 1952 dela OK. Potem pri 1960, 1970, 1980... ne dobimo
# vec enakih prezivetij (s povecevanjem leta se razlika povecuje).
# A je mogoče problem v as.Date (povezano z argumentom origin) v md.death?

data = data.frame(year = as.numeric(as.Date(paste0(yr, "-01-01"))), sex = "female", age = 0)
surv = survexp( ~ 1, times=xx*365.241, ratetable=sp2, data=data)
surv$surv - exp(-xx*365.241*sp2[1,1,1])

md.survdump(data$year, 1)


