

card_game_sim <- function(suits, cards, x_greater_than, given_that, experiments=20000, histogram=TRUE){
     # returns the expected value and the standard deviation of points
     # obtained by: having a deck with n different cards and m different
     # suits where when drawing all cards, without putting them back in
     # the deck, you get a point for each time the subsequent card drawn
     # has the same suit than the previous one. Calculations are done by
     # simulating 100,000 random experiments

     Deck<-rep(c(letters[1:suits]),times=cards/suits)
     
     shuff_Deck<-c()
     Point_count<-c()
     Point_sums<-c()
     for(l in 1:experiments){
          set.seed(l)
          shuff_Deck<-sample(Deck)
          for(k in 1:cards){
               if(k==1){
                    Point_count<-c(0)
               } else {
                    Point_count<-c(Point_count,
                                   if(shuff_Deck[k]==shuff_Deck[k-1]){
                                        1
                                   } else {
                                        0})
               }
          }
     #Points for each experiment
     Point_sums<-c(Point_sums,sum(Point_count))
     }
     
     # calculating the conditional probability
     if(missing(given_that)||missing(x_greater_than)){
          cond_prob<-NULL
     } else {
          condition<-Point_sums[Point_sums>=given_that]
          cond_prob<-length(condition[condition>x_greater_than])/length(condition)
     }
     
     # provides a histogram of the distribution from the experiments
     if(missing(histogram)||histogram){
          hist(Point_sums)} else {}
     
     # list of return values
     return_list<-list('expected_value'=mean(Point_sums),
                       'standard_dev'=sd(Point_sums),
                       'conditional_probability'=cond_prob)
     return(return_list)
     

}

