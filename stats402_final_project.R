library(readr)
drug <- read_csv("Stats402 - Applied Regression/Final Porject/Drug-Consumption-master/drug_consumption.csv")

str(drug)
colnames(drug) <- tolower(colnames(drug))

# Age Decode
age_decode = matrix(nrow = 6, ncol = 2, byrow = TRUE,
                    data =  c(-0.95197 ,    '18 - 24'   ,  
                    -0.07854 ,    '25 - 34'   , 
                    0.49788 ,    '35 - 44'   ,  
                    1.09449 ,    '45 - 54'   ,
                    1.82213 ,    '55 - 64'   , 
                    2.59171 ,    '65+'))
drug$age <- age_decode[match(drug$age, age_decode[,1]), 2, drop=F]

# Gender Decode
gender_decode = matrix(nrow = 2, ncol = 2, byrow = TRUE,
                    data =  c( 0.48246,    'Female',
                               -0.48246,    'Male')  )
drug$gender <- gender_decode[match(drug$gender, gender_decode[,1]), 2, drop=F]

# Education Decode
education_decode = matrix(nrow = 9, ncol = 2, byrow = TRUE,
                       data =  c(   -2.43591 ,      'Left School Before 16 years'     
                                    , -1.73790 ,      'Left School at 16 years'       
                                    , -1.43719 ,      'Left School at 17 years'       
                                    , -1.22751 ,      'Left School at 18 years'      
                                    , -0.61113 , 'Some College,No Certificate Or Degree' 
                                    , -0.05921 ,   'Professional Certificate/ Diploma'  
                                    ,  0.45468 ,            'University Degree'          
                                    ,  1.16365 ,              'Masters Degree'          
                                    ,  1.98437 ,             'Doctorate Degree')  )
drug$education <- education_decode[match(drug$education, education_decode[,1]), 2, drop=F]

# Ethnicity Decode
ethnicity_decode = matrix(nrow = 7, ncol = 2, byrow = TRUE,
                          data =  c(  -0.50212 ,          'Asian'    
                                      , -1.10702 ,        'Black'           
                                      ,  1.90725 ,   'Mixed-Black/Asian'    
                                      ,  0.12600 ,   'Mixed-White/Asian'    
                                      , -0.22166 ,   'Mixed-White/Black'    
                                      ,  0.11440 ,         'Other'         
                                      , -0.31685 ,         'White')  )
drug$ethnicity <- ethnicity_decode[match(drug$ethnicity, ethnicity_decode[,1]), 2, drop=F]

# Score replacements
drug$nscore <- as.numeric(as.factor(drug$nscore)) + 11
drug$escore <- as.numeric(as.factor(drug$escore)) + 15
drug$oscore <- as.numeric(as.factor(drug$oscore)) + 23
drug$ascore <- as.numeric(as.factor(drug$ascore)) + 11
drug$cscore <- as.numeric(as.factor(drug$cscore)) + 16

# Impulsive/Sensation replacements
drug$impulsive <- as.numeric(as.factor(drug$impulsive))
drug$sensation <- as.numeric(as.factor(drug$sensation))