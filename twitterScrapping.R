# Check for libraries and install if not present #
listOfPackages <- c("twitteR")
NewPackages <- listOfPackages[!(listOfPackages %in% installed.packages()[,"Package"])]
if(length(NewPackages)>0) {install.packages(NewPackages,repos="http://cran.rstudio.com/")}

library(twitteR)

# twitter data specs #
consumer_key <- "XhNvuyYFTQKi6uMqimEvkC4PC"
consumer_secret <- "Hy0hocO0S3EXw5ZDO3SuTSKcKNvNcoYo7t7vFnqrbC3N7LQF2n"
access_token <- "716067775727472641-ghDP57g1uilAleA0rUW1ZUCT7iUmV0a"
access_secret <- "zEw7MWAI01R0rwoPeKYNvZjWjJDJGIN33H5zRopMt2FNc"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
