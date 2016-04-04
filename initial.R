# Check for libraries and install if not present #
listOfPackages <- c("data.table", "lubridate", "dplyr", "magrittr", "stringr", "ggplot2", "readxl")
NewPackages <- listOfPackages[!(listOfPackages %in% installed.packages()[,"Package"])]
if(length(NewPackages)>0) {install.packages(NewPackages,repos="http://cran.rstudio.com/")}


library(magrittr)
library(dplyr)
library(data.table)
library(lubridate)
library(stringr)
library(ggplot2)
library(readxl)

#Read in data purchase data#
data_purchase = fread("approved_data_purchase-v5.csv") %>% 
  as.data.frame() %>%
  tbl_df()

#Read in ga data
ga = fread("approved_ga_data_v2.csv") %>% 
  as.data.frame() %>%
  tbl_df()

#Read in Ad Words data#
adwords = fread("approved_adwords_v3.csv") %>% 
  as.data.frame() %>%
  tbl_df()

table(data_purchase$minor_cat_name)

country = data_purchase %>%
  filter(minor_cat_name == "COUNTRY")
unique(country$event_name)

lukeBryan = country[grepl("Luke Bryan",country$primary_act_name),]

demographics = read_excel("MedianZIP-3.xlsx")

demographics = demographics %>%
  rename(venue_postal_cd_sgmt_1 = Zip)

lukeBryan$venue_postal_cd_sgmt_1 = as.numeric(lukeBryan$venue_postal_cd_sgmt_1)

# Merge with outside demographics data and select relevant columns
dataMerge = inner_join(lukeBryan, demographics, by = 'venue_postal_cd_sgmt_1') 
dataMerge = dataMerge %>%
  select(ticket_text, tickets_purchased_qty, trans_face_val_amt, delivery_type_cd,      
         event_date_time, event_dt, presale_dt, onsale_dt,sales_ord_create_dttm,  
         sales_ord_tran_dt, print_dt, venue_city, venue_state,
         venue_postal_cd_sgmt_1, sales_platform_cd, print_flg,
         la_valid_tkt_event_flg, fin_mkt_nm, Median, Mean,Pop)

# Subeset data
ga_sub = ga %>%
  sample_n(size = 100000)
data_purchase_sub = data_purchase %>%
  sample_n(size = 100000)
adwords_sub = adwords %>%
  sample_n(size = 100000)


save(lukeBryan, file = "lukeBryan.Rdata")
save(dataMerge, file = "dataMerge.Rdata")
