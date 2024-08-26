library(ggplot2)

G1 <- which(10000<WT_PLA$`TOTAL DAPI` & WT_PLA$`TOTAL DAPI` < 60000 & WT_PLA$`EDU MEAN` <500)
EarlyS <- which(10000<WT_PLA$`TOTAL DAPI`& WT_PLA$`TOTAL DAPI`< 60000 & 500<WT_PLA$`EDU MEAN` & WT_PLA$`EDU MEAN`<10000)
MidS <- which(60000<WT_PLA$`TOTAL DAPI`& WT_PLA$`TOTAL DAPI`< 120000 & 1000<WT_PLA$`EDU MEAN` & WT_PLA$`EDU MEAN`<10000)
LateS <- which(60000<WT_PLA$`TOTAL DAPI` & WT_PLA$`TOTAL DAPI`< 120000 & 1000<WT_PLA$`EDU MEAN` & WT_PLA$`EDU MEAN`<10000)
G2 <- which(80000<WT_PLA$`TOTAL DAPI`&WT_PLA$`TOTAL DAPI` <120000 & WT_PLA$`EDU MEAN`<1200)


ggplot(WT_PLA, aes(x=`TOTAL DAPI`, y= `EDU MEAN`, color= `EDU MEAN`))+
  scale_color_gradient(low = "GREY", high = "RED") +
  geom_point(data = WT_PLA[G1, ], position = "jitter") +
  geom_point(data = WT_PLA[EarlyS, ], position = "jitter") +
  geom_point(data = WT_PLA[MidS, ], position = "jitter") +
  geom_point(data = WT_PLA[LateS, ], position = "jitter") +
  geom_point(data= WT_PLA[G2, ],  position = "jitter") +
  scale_y_log10(limit=c(50,50000), name= "Mean Intensity EDU (A.U.)") +
  scale_x_continuous(limit= c(10000,150000), name = "Total DAPI Intensity (A.U.)")+
  theme(panel.background = element_blank()) +
  ggtitle("U2OS WT")+
  theme(plot.title = element_text(hjust = 0.5)) 
  
 getwd()
 setwd("/Users/susankilgas/downloads")
 write.csv(WT_PLA[G1, ], file= "Ctrl_G1_EDU_area.csv")
 write.csv(WT_PLA[EarlyS, ], file= "Ctrl_EarlyS_EDU_area.csv")
 write.csv(WT_PLA[MidS, ], file= "Ctrl_MidS_EDU_area.csv")
 write.csv(WT_PLA[LateS, ], file= "Ctrl_LateS_EDU_area.csv")
 write.csv(WT_PLA[G2, ], file= "Ctrl_G2_EDU_area.csv")
 


 