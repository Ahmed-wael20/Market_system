print("select database to work on")
data<-read.csv(file.choose())
nameofdata<-names(data)
co=0
count_item=0
count2={}
itemn=c()
txt=1
while(txt!=0){
  cat("enter the item code from 1 to ",nrow(data),"\n")
  print("if you finished press 0")
  txt <- opencv::qr_scanner()
  txt<- as.numeric(txt)
  
  if(txt!=0 & txt<=nrow(data) & txt>0){
    itemn=append(itemn,txt)
    co=co+1
  }
  else{
    if(txt!=0)
    cat("This item is not available","\n")
}}
itemn=sort(itemn)
for(i in 1:length(itemn)){  
  for(j in i:length(itemn)){
    if(itemn[i]==itemn[j]){
      if(i==1){
        count_item= count_item+1
        
      }
      else if(i>1 & itemn[i]!=itemn[i-1]){
        count_item= count_item+1}
    }
  }
  if(count_item!=0){
    count2=append(count2,count_item)
  }
  count_item=0
}
summ=0
itemn=unique(itemn)
itemn =itemn[order(itemn)]

cat("  item         ","      price","\n")
for(i in 1:length(itemn)){
  data$Quantity[itemn[i]]= data$Quantity[itemn[i]]-count2[i]
  
  cat("  item",itemn[i],"x ",count2[i] ,"       ",data$Price[itemn[i]]*count2[i],"  ","\n")
  summ=summ+(data$Price[itemn[i]]*count2[i])
}
cat("number of items       ",sum(co),"\n")
cat("mean price of items  ", summ/sum(co),"\n")
cat("min item price       ",min(data$Price[itemn]),"\n")
cat("max item price       ",max(data$Price[itemn]),"\n")
cat("required to pay      ",summ)
#write.csv(data,"items_updated3.csv")

