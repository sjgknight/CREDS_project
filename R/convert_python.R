# generate the fields that contain multiple values

clean = readRDS('data/works_from_author_ids_FINAL.RDS')

clean

fields_c = c(
  'CR',
  'related_works'
)

for (field in fields_c){
  print(field)
  a = c()
  b = c()
  for (i in 1:dim(clean)[1]){
    for (citation in clean[,field][[i]]){
      a <- append(a, citation)
      b <- append(b, clean[i, 'id'])
    }
  }
  df = data.frame(a, b)
  names(df) <- c(field, 'paper_id')
  file_name = paste(field, "RDS", sep='.')
  saveRDS(df, file_name)
}

field_list = c(
  'ids'
)


fields_frame = c(
  'author',
  'TCperYear',
  'concept'
 )


for (field in fields_frame){
  print(field)
  df_result = clean[field][[1]][[1]]
  df_id = clean['id'][1,]
  df_result$paper_id = df_id
  for (i in 2:dim(clean)[1]){
    df_tmp = clean[field][[1]][[i]]
    if (is.null(df_tmp)){
      next
    }
    if (is.na(df_tmp)){
      next
    }
    df_tmp$paper_id = clean['id'][i,]
    df_result = rbind(df_result, df_tmp)
  }
  file_name = paste(field, "RDS", sep='.')
  saveRDS(df_result, file_name)
}

df = subset(clean, select=-c(CR, related_works ,IS))
df = subset(df, select=-c(ids))
df = subset(df, select=-c(author, TCperYear, concept))
saveRDS(df, 'main_data.RDS')
