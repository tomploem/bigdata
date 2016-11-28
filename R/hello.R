
# ophalen van alle files in de directory data
files <- list.files(path = "2016-11-15-ips-csv-data/data/", full.names = FALSE, recursive = TRUE)
# split functie om een lijst van alle id's ter beschikkening te hebben
ls <- strsplit(files, "_")
# lijst waar alle unieke id's in te recht gaan komen
device_ids = c()

# iteratie over een lijst met 2 delen: ID en datum + file extentie
for (i in 1:length(ls)) {
  # afzonderen rij
  r <- ls[i]
  # filteren van device id (r[[1]][1]) en hierna toevoegen aan device_ids lijst
  device_ids <- c(device_ids, r[[1]][1])
}

# we hebben enkel unieke id's nodig
uniq_ids <- unique( device_ids )

for (id in uniq_ids){

  # creatie van een lege dataset voor een bepaald id
  df <- data.frame(device_id=numeric(0),
                   venue_id=numeric(0),
                   floor=numeric(0),
                   time=character(0),
                   entry_time=character(0),
                   quality=character(0),
                   pos_x=double(0),
                   pos_y=double(0),
                   accuracy_x=double(0),
                   accuracy_y=double(0),
                   heading=double(0),
                   walking=double(0),
                   state=character(0),
                   stream=character(0))

  # naam aan kolommen geven
  colnames(df) <- c("device_id","venue_id", "floor","time", "entry_time",
                    "quality", "pos_x","pos_y", "accuracy_x","accuracy_y",
                    "heading","walking", "state", "stream")

  for (file in files){
    # gelijk aan de contains functie kijkt grepl of het id in de bestandsnaam zit
    if (grepl(id, file)){
      # wanneer een id een overeenstemmende file vind kunnen we dit inladen en bij aan de data frame voegen
      filepath <- paste0("2016-11-15-ips-csv-data/data/", file)
      #partOfDataFrame <- read.csv(filepath, header = FALSE, sep = ",", dec=".")
      #df <- rbind(df, data.frame(partOfDataFrame))
    }
  }
  # gehele dataset van een bepaald id wegschrijven zodat we een beter overzicht krijgen

  name <- paste0(id , "_dataset.csv")
  print(name)
  #write.table(df, file = "197_dataset.csv", sep = ",",eol = "\n", na = "", dec = ".",col.names = TRUE, row.names = FALSE,fileEncoding = "UTF-8")


}


