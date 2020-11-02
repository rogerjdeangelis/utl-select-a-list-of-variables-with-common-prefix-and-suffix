Select a list of variables with common prefix and suffix                                                                           
                                                                                                                                   
Select variables that begin with S or s and end with 2020                                                                          
                                                                                                                                   
github                                                                                                                             
https://cutt.ly/vgPAAh5                                                                                                            
https://github.com/rogerjdeangelis/utl-select-a-list-of-variables-with-common-prefix-and-suffix                                    
                                                                                                                                   
https://cutt.ly/ngPAWVN                                                                                                            
https://communities.sas.com/t5/SAS-Programming/select-list-of-variables/m-p/695749                                                 
                                                                                                                                   
  Two Solutions                                                                                                                    
                                                                                                                                   
      a. Bart's package                                                                                                            
         Bartosz Jablonski                                                                                                         
         yabwon@gmail.com                                                                                                          
                                                                                                                                   
      b. Søren's varlist macro                                                                                                     
         Søren Lassen, s.lassen@post.tele.dk                                                                                       
                                                                                                                                   
                                                                                                                                   
macros (where to get varlist)                                                                                                      
https://tinyurl.com/y9nfugth                                                                                                       
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                         
                                                                                                                                   
                                                                                                                                   
*                                                                                                                                  
#####  #   #  ####   #   #  #####                                                                                                  
  #    ##  #  #   #  #   #    #                                                                                                    
  #    # # #  #   #  #   #    #                                                                                                    
  #    #  ##  ####   #   #    #                                                                                                    
  #    #   #  #      #   #    #                                                                                                    
  #    #   #  #      #   #    #                                                                                                    
#####  #   #  #       ###     #                                                                                                    
                                                                                                                                   
#! INPUT ;                                                                                                                         
                                                                                                                                   
data have;                                                                                                                         
   input var1 var2 s12020 t12020 u12020 s22020 t22020 u22020 s32020 t32020 u32020;                                                 
cards;                                                                                                                             
1 2 3 4 5 6 7 8 9 1 2                                                                                                              
;                                                                                                                                  
run;                                                                                                                               
                                                                                                                                   
                                          RULE (SELECT THE * VARIABLES)                                                            
Up to 40 obs WORK.HAVE total obs=1                                                                                                 
                                                                                                                                   
                       ******                        ******                        ******                                          
Obs    VAR1    VAR2    S12020    T12020    U12020    S22020    T22020    U22020    S32020    T32020    U32020                      
                                                                                                                                   
 1       1       2        3         4         5         6         7         8         9         1         2                        
                                                                                                                                   
*                                                                                                                                  
 ###   #   #  #####  ####   #   #  #####                                                                                           
#   #  #   #    #    #   #  #   #    #                                                                                             
#   #  #   #    #    #   #  #   #    #                                                                                             
#   #  #   #    #    ####   #   #    #                                                                                             
#   #  #   #    #    #      #   #    #                                                                                             
#   #  #   #    #    #      #   #    #                                                                                             
 ###    ###     #    #       ###     #                                                                                             
                                                                                                                                   
#! OUTPUT ;                                                                                                                        
                                                                                                                                   
WANTBART total obs=1                                                                                                               
                                                                                                                                   
  S12020    S22020    S32020                                                                                                       
                                                                                                                                   
     3         6         9                                                                                                         
                                                                                                                                   
*                                                                                                                                  
####   ####    ###    ###   #####   ###    ###                                                                                     
#   #  #   #  #   #  #   #  #      #   #  #   #                                                                                    
#   #  #   #  #   #  #      #       #      #                                                                                       
####   ####   #   #  #      ####     #      #                                                                                      
#      # #    #   #  #      #         #      #                                                                                     
#      #  #   #   #  #   #  #      #   #  #   #                                                                                    
#      #   #   ###    ###   #####   ###    ###                                                                                     
                                                                                                                                   
####     #    ####   #####                                                                                                         
 #  #   # #   #   #    #                                                                                                           
 #  #  #   #  #   #    #                                                                                                           
 ###   #####  ####     #                                                                                                           
 #  #  #   #  # #      #                                                                                                           
 #  #  #   #  #  #     #                                                                                                           
####   #   #  #   #    #                                                                                                           
                                                                                                                                   
#! BART ;                                                                                                                          
                                                                                                                                   
filename packages "%sysfunc(pathname(work))"; /* setup temporary directory for packages in the WORK */                             
filename SPFinit url "https://raw.githubusercontent.com/yabwon/SAS_PACKAGES/master/SPF/SPFinit.sas";                               
%include SPFinit; /* enable the framework */                                                                                       
                                                                                                                                   
%installPackage(BasePlus) /* install the package */                                                                                
%loadPackage(BasePlus)    /* load the package */                                                                                   
                                                                                                                                   
data wantBart;                                                                                                                     
  set have (keep= %getVars(have, pattern=^s.*2020$, varRange=_numeric_));                                                          
  put _ALL_;                                                                                                                       
run;                                                                                                                               
                                                                                                                                   
*                                                                                                                                  
 ###    ###   ####   #####  #   #                                                                                                  
#   #  #   #  #   #  #      ##  #                                                                                                  
 #     #   #  #   #  #      # # #                                                                                                  
  #    #   #  ####   ####   #  ##                                                                                                  
   #   #   #  # #    #      #   #                                                                                                  
#   #  #   #  #  #   #      #   #                                                                                                  
 ###    ###   #   #  #####  #   #                                                                                                  
                                                                                                                                   
#! SOREN ;                                                                                                                         
                                                                                                                                   
data wantSoron;                                                                                                                    
  set have (keep= %varlist(have, prx=/^s.*2020$/i));                                                                               
  put _ALL_;                                                                                                                       
run;                                                                                                                               
                                                                                                                                   
                                                                                                                                   
