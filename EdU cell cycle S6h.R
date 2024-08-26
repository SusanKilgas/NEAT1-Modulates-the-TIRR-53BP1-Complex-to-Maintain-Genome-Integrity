library(ggplot2)

G1 <- which(10000<N1_2$`TOTAL DAPI` & N1_2$`TOTAL DAPI` < 400000 & N1_2$`EDU MEAN` <500)
EarlyS <- which(10000<N1_2$`TOTAL DAPI`& N1_2$`TOTAL DAPI`< 400000 & 500<N1_2$`EDU MEAN` & N1_2$`EDU MEAN`<10000)
MidS <- which(400000<N1_2$`TOTAL DAPI`& N1_2$`TOTAL DAPI`< 850000 & 1000<N1_2$`EDU MEAN` & N1_2$`EDU MEAN`<10000)
LateS <- which(400000<N1_2$`TOTAL DAPI` & N1_2$`TOTAL DAPI`< 850000 & 1000<N1_2$`EDU MEAN` & N1_2$`EDU MEAN`<10000)
G2 <- which(500000<N1_2$`TOTAL DAPI`&N1_2$`TOTAL DAPI` <850000 & N1_2$`EDU MEAN`<1200)


ggplot(N1_2, aes(x=`TOTAL DAPI`, y= `EDU MEAN`, color= `EDU MEAN`))+
  scale_color_gradient(low = "GREY", high = "RED") +
  geom_point(data = N1_2[G1, ], position = "jitter") +
  geom_point(data = N1_2[EarlyS, ], position = "jitter") +
  geom_point(data = N1_2[MidS, ], position = "jitter") +
  geom_point(data = N1_2[LateS, ], position = "jitter") +
  geom_point(data= N1_2[G2, ],  position = "jitter") +
  scale_y_log10(limit=c(50,50000), name= "Mean Intensity EDU (A.U.)") +
  scale_x_continuous(limit= c(10000,1100000), name = "Total DAPI Intensity (A.U.)")+
  theme(panel.background = element_blank()) +
  ggtitle("sgNEAT1_2")+
  theme(plot.title = element_text(hjust = 0.5)) 
  
 getwd()
 setwd("/Users/susankilgas/downloads")
 write.csv(N1_2[G1, ], file= "N1_2rl_G1_EDU_area.csv")
 write.csv(N1_2[EarlyS, ], file= "N1_2rl_EarlyS_EDU_area.csv")
 write.csv(N1_2[MidS, ], file= "N1_2rl_MidS_EDU_area.csv")
 write.csv(N1_2[LateS, ], file= "N1_2rl_LateS_EDU_area.csv")
 write.csv(N1_2[G2, ], file= "N1_2rl_G2_EDU_area.csv")
 


 