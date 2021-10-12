
<!-- README.md is generated from README.Rmd. Please edit that file -->

# timeuse

<!-- badges: start -->
<!-- badges: end -->

An R package that contains time use activity classifications. See a list
of known time use surveys
[here](https://unstats.un.org/unsd/gender/timeuse/index.html).

Here are some time use activity classifications:

| Country       | Variable      |
|---------------|---------------|
| Australia     | `au_2006`     |
| International | `icatus_2016` |

## Installation

``` r
library(remotes)
install_github("asiripanich/timeuse")
```

## Example

[International Classification of Activities for Time Use Statistics
2016](https://unstats.un.org/unsd/classifications/Family/Detail/2083):

``` r
library(timeuse)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(knitr)

# main categories
icatus_2016 %>%
  filter(is.na(ID) & is.na(CID)) %>%
  select(1:4)
#> # A tibble: 9 x 4
#>     PID    ID   CID Title                                                                        
#>   <int> <int> <int> <chr>                                                                        
#> 1     1    NA    NA Employment and related activities                                            
#> 2     2    NA    NA Production of goods for own final use                                        
#> 3     3    NA    NA Unpaid domestic services for household and family members                    
#> 4     4    NA    NA Unpaid caregiving services for household and family members                  
#> 5     5    NA    NA Unpaid volunteer, trainee and other unpaid work                              
#> 6     6    NA    NA Learning                                                                     
#> 7     7    NA    NA Socializing and communication, community participation and religious practice
#> 8     8    NA    NA Culture, leisure, mass-media and sports practices                            
#> 9     9    NA    NA Self-care and maintenance
# numbers of sub-categories in each main category (PID)
icatus_2016 %>%
  filter(!is.na(ID)) %>%
  distinct(PID, ID, .keep_all = TRUE) %>%
  count(PID)
#> # A tibble: 9 x 2
#>     PID     n
#>   <int> <int>
#> 1     1     8
#> 2     2     5
#> 3     3     9
#> 4     4     5
#> 5     5     5
#> 6     6     5
#> 7     7     6
#> 8     8     7
#> 9     9     6
icatus_2016 %>%
  head(2) %>%
  knitr::kable()
```

| PID |  ID | CID | Title                                                              | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Includes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Excludes                                                                                                                                                                                                                                                 | Examples |
|----:|----:|----:|:-------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------|
|   1 |  NA |  NA | Employment and related activities                                  | Refers to employment, defined as activities to produce goods or provide services for pay or profit and to other activities directly related to employment.â€“ ‘For pay or profit’ refers to work done as part of a transaction in exchange for remuneration payable in the form of wages or salaries for time worked or work done, or in the form of profits derived from the goods and services produced through market transactions, specified in the most recent international statistical standards concerning employmentâ€“related income.â€“ (a) The remuneration may be in cash or in kind, whether actually received or not, and may also comprise additional components of cash or inâ€“kind income.â€“ (b) The remuneration may be payable directly to the person performing the work or indirectly to a household or family member.(Source: 19th ICLS paragraphs 7b and 27 and 28)â€“ Related activities are travelling and commuting for employment, breaks during working time, training and studies in relation to employment, seeking employment, and other related activities outside working time.â€“ Activities in divisions 11, 12 and 13 equate the time spent carrying out the tasks and duties of a job, and defined as to ‘direct hours’ in paragraph 11.(2)(a) of the Resolution concerning the measurement of working time adopted by the 18th International Conference of Labour Statisticians (2008). | â€“ 11 Employment in corporations, government and non-profit institutionsâ€“ 12 Employment in household enterprises to produce goodsâ€“ 13 Employment in households and household enterprises to provide servicesâ€“ 14 Ancillary activities and breaks related to employmentâ€“ 15 Training and studies in relation to employmentâ€“ 16 Seeking employmentâ€“ 17 Setting up a businessâ€“ 18 Travelling and commuting for employmentâ€“ Activities in all branches of economic activities in both self-employment and paid employment | â€“ 2 Production of goods for own final useâ€“ 3 Unpaid domestic services for household and family membersâ€“ 4 Unpaid caregiving services for household and family membersâ€“ 5 Unpaid volunteer, trainee and other unpaid work (including internships) |          |
|   1 |  11 |  NA | Employment in corporations, government and non-profit institutions | See Group 110                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |                                                                                                                                                                                                                                                          |          |
