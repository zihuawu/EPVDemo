code.dir <- "./code"
data.dir <- "./data"
# code.dir <- "~/xyhoops/XYHoops/dlc_src/new/demo/code"
# data.dir <- "~/xyhoops/XYHoops/dlc_src/new/demo/data"

args <- as.vector(commandArgs(trailingOnly=TRUE))
draw <- as.numeric(args[1])

load(sprintf("%s/playerbases.Rdata", data.dir))
players <- read.csv(sprintf("%s/players2013.csv", data.dir))

source(sprintf("%s/data_formatting.R", code.dir))
source(sprintf("%s/covariates.R", code.dir))
source(sprintf("%s/model_util.R", code.dir))

load(sprintf("%s/new.dat.Rdata", data.dir))

def.micro <- microDefModel(new.dat)

hyper <- getHyperParams(new.dat)
ev.out <- evLineups(new.dat)
  
fv.epv.list <- allCalcs(new.dat, hyper, def.micro, ev.out, nmic=5)
epv <- compressEPV(datex, fv.epv.list)

dir.create(sprintf("%s/EPVdraws/", data.dir))
save(epv, file=sprintf("%s/EPVdraws/%03.f.Rdata", data.dir, draw))

# 293 + 248 + 258 + 271 + 231 + 404 + 420 = 35:25

3252 + 5 * 2500 + 3509