#Load libraries 
library(jsonlite)
library(readr)
library(tidyverse)
library(lubridate)
library(tidytext)
library(dplyr)
library(tidyr)
library(stringr)
library(purrr)
library(tidytext)
library(topicmodels)
library(sentimentr)
library(tm)
library(ggplot2)
library(plotly)
library(wordcloud)
library(igraph)

#load file 
#read_json("/Users/akashshinde/Downloads/e2e4a06022a2f95165f66b7e9b36a515558de6400309a9ffb60bf68af18b796f-2025-07-26-13-11-07-4cc90daf4c8a498294026bf1b5feec4b/shared_conversations.json")
#read_json("/Users/akashshinde/Downloads/e2e4a06022a2f95165f66b7e9b36a515558de6400309a9ffb60bf68af18b796f-2025-07-26-13-11-07-4cc90daf4c8a498294026bf1b5feec4b/conversations.json")

cat(" Welcome to the Visualizer ")
cat(" Please choose the type of data you want to process :D ")
cat(" 1. Google Search/MyActivity 💻")
cat(" 2. ChatGPT Conversation 🤖")
cat(" 3. text file 📔")
cat(" 4. image file 🖼️")

data_type_selected <- NULL
if (user_data_type_choice == "1") 
{
  data_type_selected <- "Google Search"
} else if (user_data_type_choice == "2") {
  data_type_selected <- "Chatgpt"
} else if (user_data_type_choice == "3") {
  data_type_selected <- "Text-file"
} else if (user_data_type_choice == "4") {
  data_type_selected <- "Image-File"
} else if (user_data_type_choice == "5") {
  data_type_selected <- "Audio-file"
}else {
  stop(" Invalid data type choice! :\ ")
}

cat(" Now, please choose the format of the file you want to upload 📋🧐")
cat(" 1. JSON (.json )")
cat("2. CSV (.csv )")
cat("3. Plain Text (.txt file) ")
cat("4. Image file (.png, .jpeg, .jpg) ").     #THIS PROHEJT CANNOT PERFORM ACTIVITIES ON IMAGE FILES FOR NOW. GOTTA MAKE AN API FOR THAT IG 
cat("5. Audio file (.mp3) ")                   #THIS PROHEJT CANNOT PERFORM ACTIVITIES ON MUSIC FILES FOR NOW. GOTTA MAKE AN API FOR THAT IG 
user_file_format_choice <- readline("Enter number for file format 1, 2, 3, 4, or 5 :D ")

file_format_selected <- NULL
valid_json_exts <- c(".json")
valid_csv_exts <- c(".csv")
valid_txt_exts <- c(".txt")
valid_image_exts <- c(".png", ".jpeg", ".jpg")       #THIS PROHEJT CANNOT PERFORM ACTIVITIES ON IMAGE FILES FOR NOW. GOTTA MAKE AN API FOR THAT IG 
valid_audio_exts <- c(".mp3" )                       #THIS PROHEJT CANNOT PERFORM ACTIVITIES ON MUSIC FILES FOR NOW. GOTTA MAKE AN API FOR THAT IG 

if (user_file_format_choice==1)
{
  file_format_selected <- "json"
} else if (user_file_format_choice==2)
{
  file_format_selected <- "csv"
} else if (user_file_format_choice==3)
{
  file_format_selected <- "txt"
} else if (user_file_format_choice==4)
{
  file_format_selected <- "image file"
} else if (user_file_format_choice==5)
{
  file_format_selected <- "audio file"
} else 
{
  stop(" Invalid file format choice :'( ")
}

cat(" Please Navigate through to the file you want to open! :) ")
json_file_path <- file.choose() 

#File error 


if (is.null(json_file_path) || nchar(json_file_path) == 0)
{
  print(" No File was chosen for Analysis :( ")
}

if (!endsWith(tolower(json_file_path), ".json"))
{
  print(" It seems this is not a .json file please check the fileformat :\ ")
}

