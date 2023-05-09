#####################################################################################################################

THIS DATA PACKAGE ACCOMPANIES: The Diversity of Animals Identified as Keystone Species, I. Shukla, K.M. Gaynor, B. Worm, C.T Darimont
This data package contains the original dataset as well as R code used to generate figures and analysis.

############################################# CONTENTS ######################################################################## 

1. Shukla et al. README.txt -- This file, including a description of variables.
2. Diversity_of_keystones_suppList.csv --  A data file that includes the full list of author-identified keystone species
3. Diversity_of_keystones_index.csv -- A data file of each of the keystone traits indexed for a k-means clustering analysis
4. Keystone_diversity_code.R -- supplementary code of the descriptive statisics, k-means clustering analysis, and vizualization for keystone trait diversity

#####################################################################################################################

VARIABLE NAMES AND DESCRIPTIONS

FILE: Diversity of Keystones_suppList.csv

Latin name: Indicates species scientific name
Common name: Species common name
Order: Species Taxonomic Order
Title: Title of the publication from which the species was sourced 
Authors: Condensed citation of the lead author(s)
Year: Year that the article was published
Journal: Journal that the article was published in. NA indicates a book
Community Response: The catagorey of signifcant community change caused by keystone absence/ decreased presence 
Additional community response: Additional community chnage indicated by the authors
Justification for keystoneness: Method that the authors used to justify a species kesytone status
Detailed justification: subcatagorey of "Justification for keystoneness"

FILE: Animalia_Index.csv
id: Indicates an individual data point
common_name: Species common name
class: Species taxonomic class. "1" <- "Fish", "2" <- "herp", "3" <- "bird", "4" <- "mammal", "5" <- "arthropod", "6" <- "echinoderm", "7" <- "mollusc"
role: functional role that the keystone species performs. "1" <- "consumer", "2" <- "prey", "3" <- "modifier"
trophic_simp: Simplified keystone species trophic level. "1" <- "low", "2" <- "mid", "3" <- "high" 
log_mass <- Species average body mass, logged 

#####################################################################################################################

ACKNOWLEDGEMENTS

This database was compiled by IS using published literature. IS was funded by a Raincoast Conservation Fellowship, and CTD by an NSERC Discovery Grant.






