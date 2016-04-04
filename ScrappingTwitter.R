list.of.packages <- c("parallel","truncnorm","ggplot2","gridExtra","twitteR","stringr","httr","RCurl",
                      "rjson","tm","wordcloud","foreach","googleVis","shiny","base64enc")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

lapply(list.of.packages, suppressPackageStartupMessages(library),character.only = TRUE)

options(httr_oauth_cache=T)
# api_key <- "hftNGPFqzf9GMnHLMQVnNV7Vz"
#
# api_secret <- "HjTPQByqFDdriKKEixRbm4UNn2golHR5qGPbrPogRDm0tQkFua"
#
# access_token <- "296897722-PllUrWEvYediPUkYtJf8dwr2vmZe0p5O0mWP46Cc"
#
# access_token_secret <- "1NySI44qSZW0Ie6SEesd1T28NOun3NiOPyhe3QxLaNvuY"
#
# setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
consumer_key <- "XhNvuyYFTQKi6uMqimEvkC4PC"
consumer_secret <- "Hy0hocO0S3EXw5ZDO3SuTSKcKNvNcoYo7t7vFnqrbC3N7LQF2n"
access_token <- "716067775727472641-ghDP57g1uilAleA0rUW1ZUCT7iUmV0a"
access_secret <- "zEw7MWAI01R0rwoPeKYNvZjWjJDJGIN33H5zRopMt2FNc"

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)



#data frame for drop down menu and data visualization
geoinfo_state = data.frame( "cities" = c("ALBUQUERQUE",
                                        "ATLANTA",
                                        "BALTIMORE",
                                        "BOSSIER CITY",
                                        "BRISTOW",
                                        "BURGETTSTOWN",
                                        "CAMDEN",
                                        "CHARLESTON",
                                        "CHARLOTTE",
                                        "CHARLOTTESVILLE",
                                        "CHICAGO",
                                        "CHULA VISTA",
                                        "CINCINNATI",
                                        "CLEVELAND",
                                        "CONCORD",
                                        "DALLAS",
                                        "DARIEN CENTER",
                                        "DENVER",
                                        "EVANSVILLE",
                                        "FRESNO",
                                        "IRVINE",
                                        "JACKSONVILLE",
                                        "LAS CRUCES",
                                        "MARYLAND HEIGHTS",
                                        "NASHVILLE",
                                        "NOBLESVILLE",
                                        "NORTH LITTLE ROCK",
                                        "OKLAHOMA CITY",
                                        "OMAHA",
                                        "PEORIA",
                                        "RALEIGH",
                                        "SAN ANTONIO",
                                        "SANTA CLARA",
                                        "SCRANTON",
                                        "TAMPA",
                                        "TULSA",
                                        "UNCASVILLE",
                                        "UNIVERSITY PARK",
                                        "VIRGINIA BEACH",
                                        "WEST PALM BEACH",
                                        "WHEATLAND"),
                           "cityGeo" = c("35.08533,-106.6055534,500mi",
                                         "33.749,-84.3879824,500mi",
                                         "39.29038,-76.6121893,500mi",
                                         "32.51599,-93.7321228,500mi",
                                         "38.7233,-77.5367043,500mi",
                                         "40.38201,-80.3928423,500mi",
                                         "51.55171,-0.1588255,500mi",
                                         "32.77647,-79.9310512,500mi",
                                         "35.22709,-80.8431267,500mi",
                                         "38.02931,-78.4766781,500mi",
                                         "41.87811,-87.6297982,500mi",
                                         "32.64005,-117.0841955,500mi",
                                         "39.10312,-84.5120196,500mi",
                                         "41.49932,-81.6943605,500mi",
                                         "37.97798,-122.0310733,500mi",
                                         "32.77666,-96.7969879,500mi",
                                         "42.90117,-78.3886312,500mi",
                                         "39.73924,-104.990251,500mi",
                                         "37.97156,-87.5710898,500mi",
                                         "36.74684,-119.7725868,500mi",
                                         "33.68395,-117.7946942,500mi",
                                         "30.33218,-81.655651,500mi",
                                         "32.31994,-106.7636538,500mi",
                                         "38.71311,-90.4298401,500mi",
                                         "36.16266,-86.7816016,500mi",
                                         "40.04559,-86.0085955,500mi",
                                         "34.76954,-92.2670941,500mi",
                                         "35.46756,-97.5164276,500mi",
                                         "41.25236,-95.9979883,500mi",
                                         "40.69365,-89.5889864,500mi",
                                         "35.77959,-78.6381787,500mi",
                                         "29.42412,-98.4936282,500mi",
                                         "37.35411,-121.9552356,500mi",
                                         "41.40897,-75.6624122,500mi",
                                         "27.95058,-82.4571776,500mi",
                                         "36.15398,-95.992775,500mi",
                                         "41.43169,-72.1100945,500mi",
                                         "32.85504,-96.797592,500mi",
                                         "36.85293,-75.977985,500mi",
                                         "26.71534,-80.0533746,500mi",
                                         "42.05441,-104.9527501,500mi"),
                            "GeoforGoogle" = c("35.08533:-106.6055534",
                                               "33.749:-84.3879824",
                                               "39.29038:-76.6121893",
                                               "32.51599:-93.7321228",
                                               "38.7233:-77.5367043",
                                               "40.38201:-80.3928423",
                                               "51.55171:-0.1588255",
                                               "32.77647:-79.9310512",
                                               "35.22709:-80.8431267",
                                               "38.02931:-78.4766781",
                                               "41.87811:-87.6297982",
                                               "32.64005:-117.0841955",
                                               "39.10312:-84.5120196",
                                               "41.49932:-81.6943605",
                                               "37.97798:-122.0310733",
                                               "32.77666:-96.7969879",
                                               "42.90117:-78.3886312",
                                               "39.73924:-104.990251",
                                               "37.97156:-87.5710898",
                                               "36.74684:-119.7725868",
                                               "33.68395:-117.7946942",
                                               "30.33218:-81.655651",
                                               "32.31994:-106.7636538",
                                               "38.71311:-90.4298401",
                                               "36.16266:-86.7816016",
                                               "40.04559:-86.0085955",
                                               "34.76954:-92.2670941",
                                               "35.46756:-97.5164276",
                                               "41.25236:-95.9979883",
                                               "40.69365:-89.5889864",
                                               "35.77959:-78.6381787",
                                               "29.42412:-98.4936282",
                                               "37.35411:-121.9552356",
                                               "41.40897:-75.6624122",
                                               "27.95058:-82.4571776",
                                               "36.15398:-95.992775",
                                               "41.43169:-72.1100945",
                                               "32.85504:-96.797592",
                                               "36.85293:-75.977985",
                                               "26.71534:-80.0533746",
                                               "42.05441:-104.9527501"),
                           stringsAsFactors = F)




clean.text <- function(some_txt)
{
  some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
  some_txt = gsub("@\\w+", "", some_txt)
  some_txt = gsub("[[:punct:]]", "", some_txt)
  some_txt = gsub("[[:digit:]]", "", some_txt)
  some_txt = gsub("http\\w+", "", some_txt)
  some_txt = gsub("[ \t]{2,}", "", some_txt)
  some_txt = gsub("^\\s+|\\s+$", "", some_txt)
  some_txt = gsub("amp", "", some_txt)
  # define "tolower error handling" function
  try.tolower = function(x)
  {
    y = NA
    try_error = tryCatch(tolower(x), error=function(e) e)
    if (!inherits(try_error, "error"))
      y = tolower(x)
    return(y)
  }

  some_txt = sapply(some_txt, try.tolower)
  some_txt = some_txt[some_txt != ""]
  names(some_txt) = NULL
  return(some_txt)
}




n_tweets=500
keyword = "bryan"

# statePick_Geo = geoinfo_state[which(geoinfo_state$State=="California"),2]
# print("Getting tweets...")
#
# # get some tweets
# tweets = searchTwitter(keyword, n_tweets, lang="en",
#                        geocode = paste(statePick_Geo) )
# # get text
# tweet_txt = sapply(tweets, function(x) x$getText())
#
# # clean text
# tweet_clean = clean.text(tweet_txt)
# tweet_num = length(tweet_clean)
# # data frame (text, sentiment)
# tweet_df = data.frame(text=tweet_clean, sentiment=rep("", tweet_num),stringsAsFactors=FALSE)
#
# #   count.docs = removeWords(tweet_df$text, stopwords("german"))
# #   count.docs = removeWords(tweet_df$text, stopwords("english"))
#
# all_text <- paste(tweet_df$text, collapse = " ")
# corpus <- Corpus(VectorSource(all_text))
# #remove punctuation
# corpus <- tm_map(corpus, removePunctuation)
# #remove numbers
# corpus <- tm_map(corpus, removeNumbers)
# #remove redundant white space
# corpus <- tm_map(corpus, stripWhitespace)
# #remove stopwords in English
# corpus <- tm_map(corpus, removeWords,stopwords("en"))
# dtm <- as.matrix(DocumentTermMatrix(corpus))
# freq <- sort(colSums(dtm),decreasing = TRUE)
# freq <- as.data.frame(freq)
#
#
# n_topKey_State=25
# TopN = head(freq,n_topKey_State)
# TopN$word = row.names(TopN)
# colnames(TopN)[2] = "California"
# colnames(TopN)[1] = "Rank"
# TopN[1] = seq.int(nrow(TopN))
# TopN



#################################################################################

GEO_map = matrix(NA, 41, 3)
Topnum = vector(mode = "numeric", length = 41)
Topfreq = vector(mode = "numeric", length = 41)
#keyword = input$Keywd

for (i in 1:nrow(geoinfo_state)){
  Sys.sleep(1)
  geocode_city = geoinfo_state[i,2]
  #stopifnot(nchar(geocode_state)==2)
  print("Getting tweets...")

  # get some tweets
  tweets = searchTwitter(keyword, n_tweets, lang="en",
                         geocode = paste(geocode_city))

  # get text
  tweet_txt = sapply(tweets, function(x) x$getText())

  # clean text
  tweet_clean = clean.text(tweet_txt)
  tweet_num = length(tweet_clean)
  # data frame (text, sentiment)
  tweet_df = data.frame(text=tweet_clean, sentiment=rep("", tweet_num),stringsAsFactors=FALSE)

  #         count.docs = removeWords(tweet_df$text, stopwords("german"))
  #         count.docs = removeWords(tweet_df$text, stopwords("english"))

  all_text <- paste(tweet_df$text, collapse = " ")
  corpus <- Corpus(VectorSource(all_text))
  corpus <- tm_map(corpus, content_transformer(tolower))
  #remove punctuation
  corpus <- tm_map(corpus, removePunctuation)
  #remove numbers
  corpus <- tm_map(corpus, removeNumbers)
  #remove redundant white space
  corpus <- tm_map(corpus, stripWhitespace)
  #remove stopwords in English
  corpus <- tm_map(corpus, removeWords,stopwords("en"))
  dtm <- as.matrix(DocumentTermMatrix(corpus))
  freq <- sort(colSums(dtm),decreasing = TRUE)
  SUMf = sum(freq)
  freq <- as.data.frame(freq)
  Top = freq
  Top$word = row.names(Top)
  rownames(Top) <- NULL
  #key word percentage
  if(length(which(Top$word==tolower(keyword)))==0){
    Topnum[i]=0
    Topfreq[i]=0
  }else{
    Topnum[i] = round(Top$freq[which(Top$word==tolower(keyword))]/SUMf,4)
    Topfreq[i] = Top$freq[which(Top$word==tolower(keyword))]
  }
  GEO_map[i,] = c(geoinfo_state[i,3],Topnum[i],Topfreq[i])
}



GEO_map = as.data.frame(GEO_map,stringsAsFactors = FALSE)
  GEO_map$City = geoinfo_state[,1]
  GEO_map=GEO_map[,c(4,1,2,3)]
  colnames(GEO_map) = c("City","CityGeo", "Percentage_overwholewords","Total_Num_Metioning_Keyword")
  GEO_map


  wordcloud(corpus, min.freq=25, scale=c(5,2),rot.per = 0.25,
             max.word=45, random.order=F)



############googleVis#######################

  map_heat = gvisGeoChart(GEO_map, locationvar='CityGeo', colorvar = 'Percentage_overwholewords',hovervar='City',
                          options=list(region='US',projection="kavrayskiy-vii",
                                       displayMode="markers", resolution="provinces",
                                       colorAxis="{colors:['yellow','red']}",width=650, height=400))
  T <- gvisTable(GEO_map,
                 options=list(width=390, height=450))

  GT <- gvisMerge(map_heat,T, horizontal=TRUE)
  plot(GT)


  map_heat1 = gvisGeoChart(GEO_map, locationvar='CityGeo', colorvar = 'Total_Num_Metioning_Keyword',
                           hovervar='City',
                          options=list(region='US',projection="kavrayskiy-vii",
                                       displayMode="markers", resolution="provinces",
                                       colorAxis="{colors:['yellow','red']}",width=650, height=400))
  T1 <- gvisTable(GEO_map,
                 options=list(width=390, height=450))

  GT1 <- gvisMerge(map_heat1,T1, horizontal=TRUE)
  plot(GT1)
####################################################################################






#for word cloud
tdm = TermDocumentMatrix(corpus)
tdm = as.matrix(tdm)
colnames(tdm) = labels


wordcloud(tdm, max.words = 100, random.order = FALSE)


# # comparison word cloud
cpCloud = comparison.cloud(tdm, colors = brewer.pal(8, "Dark2"),
                           scale = c(3,.5), random.order = FALSE, title.size = 1.5)
# cpCloud
#






#################################################################################
##################correlation

load("/Users/YY/Documents/DUKE/Courses/2016Spring/DATAFEST/Bayesians-in-the-streets/data2.Rdata")
buy = data2
colnames(buy)[1] <- "City"
combined = merge(buy, GEO_map,by = "City")
combined$Percentage_overwholewords=as.numeric(combined$Percentage_overwholewords)
combined$Total_Num_Metioning_Keyword=as.numeric(combined$Total_Num_Metioning_Keyword)
library("corrgram")

corrgram(combined[c("price","number_purchased","med_income","Number Transactions","Percentage_overwholewords", "Total_Num_Metioning_Keyword")],font.labels=1,cex.labels=1,
labels=c("price","number_purchased","med_income","Number Transactions","Percentage_overwholewords", "Total_Num_Metioning_Keyword"),
         lower.panel=panel.shade,
upper.panel=panel.conf,
diag.panel=panel.density,
         text.panel=panel.txt)


library(ellipse)
R=cor(combined[c("price","number_purchased","med_income","Number Transactions",
                 "Percentage_overwholewords", "Total_Num_Metioning_Keyword")])
plotcorr(R, col = colorRampPalette(c("firebrick3", "white", "navy"))(10))



corrgram(combined[c("price","number_purchased","med_income","Number Transactions","Percentage_overwholewords", "Total_Num_Metioning_Keyword")],
         labels=c("price","number_purchased","med_income","Number Transactions","Percentage_overwholewords", "Total_Num_Metioning_Keyword"),
         lower.panel=panel.pts, upper.panel=panel.conf, diag.panel=panel.density)

#################################################################################


setwd("/Users/YY/Documents/DUKE/Courses/2016Spring/DATAFEST")
save(GEO_map, file = "GEO_map.Rdata")





#############################################
##################Top words##################
gethotword = function(n_tweets,keyword,myCity){
Pick_Geo = geoinfo_state[which(geoinfo_state$cities==myCity),2]
print("Getting tweets...")

# get some tweets
tweets = searchTwitter(keyword, n_tweets, lang="en",
                       geocode = paste(Pick_Geo) )
# get text
tweet_txt = sapply(tweets, function(x) x$getText())

# clean text
tweet_clean = clean.text(tweet_txt)
tweet_num = length(tweet_clean)
# data frame (text, sentiment)
tweet_df = data.frame(text=tweet_clean, sentiment=rep("", tweet_num),stringsAsFactors=FALSE)

#   count.docs = removeWords(tweet_df$text, stopwords("german"))
#   count.docs = removeWords(tweet_df$text, stopwords("english"))

all_text <- paste(tweet_df$text, collapse = " ")
corpus <- Corpus(VectorSource(all_text))
#remove punctuation
corpus <- tm_map(corpus, removePunctuation)
#remove numbers
corpus <- tm_map(corpus, removeNumbers)
#remove redundant white space
corpus <- tm_map(corpus, stripWhitespace)
#remove stopwords in English
corpus <- tm_map(corpus, removeWords,stopwords("en"))
dtm <- as.matrix(DocumentTermMatrix(corpus))
freq <- sort(colSums(dtm),decreasing = TRUE)
freq <- as.data.frame(freq)

Topnumber = 25
TopN = head(freq,Topnumber)
TopN$word = row.names(TopN)
colnames(TopN)[2] = myCity
colnames(TopN)[1] = "Rank"
TopN[1] = seq.int(nrow(TopN))
return(TopN)
}


OKLAHOMA=gethotword(500," luke + bryan","OKLAHOMA CITY")
BRISTOW=gethotword(500," luke + bryan","BRISTOW")

setwd("/Users/YY/Documents/DUKE/Courses/2016Spring/DATAFEST")
save(OKLAHOMA, file = "OKLAHOMA.Rdata")
save(BRISTOW, file = "BRISTOW.Rdata")
