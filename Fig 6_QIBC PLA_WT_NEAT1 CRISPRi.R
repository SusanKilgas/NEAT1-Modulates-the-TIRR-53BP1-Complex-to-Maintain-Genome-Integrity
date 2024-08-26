library(ggplot2)

G1 <- which(27000<N1_C3$`TOTAL DAPI` & N1_C3$`TOTAL DAPI` < 55000 & N1_C3$`EDU MEAN` <1000)
EarlyS <- which(27000<N1_C3$`TOTAL DAPI`& N1_C3$`TOTAL DAPI`< 55000 & 500<N1_C3$`EDU MEAN` & N1_C3$`EDU MEAN`<10000)
MidS <- which(50000<N1_C3$`TOTAL DAPI`& N1_C3$`TOTAL DAPI`< 80000 & 500<N1_C3$`EDU MEAN` & N1_C3$`EDU MEAN`<10000)
LateS <- which(80000<N1_C3$`TOTAL DAPI` & N1_C3$`TOTAL DAPI`< 110000 & 500<N1_C3$`EDU MEAN` & N1_C3$`EDU MEAN`<10000)
G2 <- which(80000<N1_C3$`TOTAL DAPI`&N1_C3$`TOTAL DAPI` <110000 & N1_C3$`EDU MEAN`<1000)


ggplot(N1_C3, aes(x=`TOTAL DAPI`, y= `EDU MEAN`, color= `PLA FOCI`))+
  scale_color_gradient(low = "GREY", high = "RED") +
  geom_point(data = N1_C3[G1, ], position = "jitter") +
  geom_point(data = N1_C3[EarlyS, ], position = "jitter") +
  geom_point(data = N1_C3[MidS, ], position = "jitter") +
  geom_point(data = N1_C3[LateS, ], position = "jitter") +
  geom_point(data= N1_C3[G2, ],  position = "jitter") +
  scale_y_log10(limit=c(50,50000), name= "Mean Intensity EDU (A.U.)") +
  scale_x_continuous(limit= c(10000,110000), name = "Total DAPI Intensity (A.U.)")+
  theme(panel.background = element_blank()) +
  ggtitle("U2OS WT")+
  theme(plot.title = element_text(hjust = 0.5)) 
  
 getwd()
 setwd("/Users/susankilgas/downloads")
 write.csv(N1_C3[G1, ], file= "Ctrl_G1_EDU_area.csv")
 write.csv(N1_C3[EarlyS, ], file= "Ctrl_EarlyS_EDU_area.csv")
 write.csv(N1_C3[MidS, ], file= "Ctrl_MidS_EDU_area.csv")
 write.csv(N1_C3[LateS, ], file= "Ctrl_LateS_EDU_area.csv")
 write.csv(N1_C3[G2, ], file= "Ctrl_G2_EDU_area.csv")
 


 