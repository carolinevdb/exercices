# exercices
The course contains solution of exercises and cursus of database technology.

# Table of contents
1.  MySQL
2.  MySQL workbench
3.  Normalization
4.  NoSQL
5.  Databases, APIs & Version control

# Summary of the course
What is database?
 =is structured collection of data
 Different types:
	> online store database: products customer details and orders
	> database for a web forum: members, forums, topics and posts
	> database for a blog system: users, blog posts categories, tags and comments
 Database managment system (DBMS):
	> software that manges database
	> MySQL => relational db mangement system
 Database model:
	> organize data in database
	> Use: data storage, data retrieval, data manipulation and authentication & authorization
 Conclusion: DB is collection of related data managed by DMBS such as MysSQL, a web script communicate with DBMS in order to insert, update, delete and retrieve data in DB

Why use a database?
 >> if you have stored data in text files such as comma-separatd value (CSV) files.
 >> This is fine for simple data and small amount but not convenient for greater data.
 >> Solution: Relational db
	> fast, uses indexes, or keys, to find records of data
	> reliable
	> let you link records together 

Why use MySQL?
 	> open source
	> widely availble
	> easy to use
	> works well in PHP

Relational db with MySQL
 Column types:
	> INT() => number
	> FLOAT() => nr with decimal point
	> DATE => YYYY-MM-DD
	> VARCHAR() & CHAR() => string with a certain number of characters
	> TEXT & BLOB => used for texts that aren't queried often or don't have to be searchale, BLOB for binary data
	> EMUM => list of permitted values
 JOINS: DB are very sensitive for mistakes => prevent this
	> tables are split into diffrent tables => foreign keys
	> in table => new trajectory => data types are linked between diffrent tables 
	> cross linking table
	>> 4 types:
		> INNER JOIN: only row present in both tables, where trajectory is not null
		> LEFT JOIN: all rows of left table, even without linked data in right table => tables fit together
		> RIGHT JOIN: all rows of right table, even without linked data in left table
 VIEW:
  = virtual table that is used to serve up data in an orderly fashion
 Entity Relationship Diagram (ERD):
 = creation of a db is bases on db model
	> one-to-many relationship
	> many-to-many relationship

Databases and shemas
 What is Mysql Workbench:
 = visual tool for creating, executing and optimizing SQL queries
 Function:	> visually desing model generate and mange databases
 3 diffrent types of data modelling:
	> conceptual data model: determines the structure and/of relationship between entites with the use of ERD
	> local data model: determines the structure and/or relationship between tables using foreign keys and visualised in data structure diagram
	> physical data model: way in which data is stored
 Diffrent db models:
	> flat model: single 2D array of date elements
	> hierachical model: data is organized into tree-like structure and records are connected through links
	> network model: each record can have multiple parents and child records
	> relational model: object oriented features
	> object oriented model: data is represented in form of objects

Databases normalization
 = process of organizing columns and tables of relational db to reduce data redundancy and improve integrity
 UNF	simple db data model. groups all data in 1 entity
 1NF	eliminate repeating groups in individual tables
	create separated table for each set of related data
	identify each set of releated dat with primary key
	each row should have a primary key
 2NF	non-prime attribute is depenent on the hole key of every candidate key
	no partial dependency of any column on primary key
 3NF	non-prime attributes is non-transively dependent on every key
	non-prime attribyt of table must be dependen on primary key
 BCNF	any attribute on which some other attribute is full functionally dependent = D, every D is candidate keys

Forward/reverse engineering
 Use:	>Forward: to export your schema desing to a MySQL server
	>Reverse: export a table to schema
Exporting/import data
 Export	>mysqldump db > db.sql will dump a MySQL db, compress and save it into a file => backup 
 Import	>entire dump file is imported
MySQL and other languages
 SQL SELECT cmd	> to take bacup of any table
		> complete db dump you will need to write separate query for separate table 

NoSQL
= provides mech for storage and retrieval of data, more flexible but doesn't provide atomicity, consitency, isolation and durability
 Varous approaches to classify NoSQL db:
	> column store: consists of unique name, value and timestamp. nr of col could be diffent from rows
	> key-value store: consist of data stored in d{} or hash. it has unique key per record. data is represented as collection of key-values pairs such that each possible key appears at most once in the collection
	> graph store: design for data whose relations are represented as graph consisting of elements interconnecte finite nr of relations between them. it's represente using nodes edges and properties
	> multi model: designed to support multiple data models against a singel intergrated backend. Document, graph relational, and key-values moder are example of data models that may be supported
	> document store: computer program designed for storing, retrieving and managing document-orientend info. all info fr given object is stored in singel instance
 MongoDB
  =is document store that has no predefined data formats
 how	> in flexible, JSON-like doc. 
	> exists of objects and arrays and attribute-value pairs 
 data types:
  use: 	>> dot notation to access elem of array en access the fields of embedded doc
	>> primary key: unique index on _id field during the creation of a collection
	>> objectId: small; likely unique, fast to generate and ordered
	>> string
	>> timestamp: for internal mongodb use => 1) time_t values 2) incrementing ordinal for operations within a given second
	>> date: nr of ms since Unix epoch

Databases in bioinformatics:
= are libaries of life sciences info collected for scintif exp, published literature, HT exp tech, computational analysis
	> inf contained in bio db includes gene function, stucture, localization, clinical effects of mutations as well as similarties of bio seq and structures. 
 Characterisation of diffrent types of db is based on several properties:
	> type of data: Nt seq, Ew seq, gene expression date, metabolic pathays or 3D structures
	> data entry & quality control:
		> data deposited directly
		> appointed curators add and update data
		> treatment of erroneous data
		> type and ° of error checking 
	> primary of derived data:
		> primary db
		> secondary db
		> aggregate of many db
		> consolidation of data refers to collection and integration of data from multiple sources into a singel destination
		> combination of data
	> technical design:
		> flat files 
		> relational db
		> object oriented db
	> maintainer status:
		> large public institution (EMBL, NCBI)
		> academic institute (SIB )
		> academic group or scientist
		> commercial company
	> availabilty
		> publicly availble 
		> avaible but copyright
		> accesible but not downloadable
		> academic, not freely available
		> commercial
 Identifiers and accesion codes
  = identify an entry
  identifier		> string of letters and digits, it can usually change
  accecion code 	> nr that uniquely identifies an entry in its db and it stays the same
Primary db
 = are populated with exp derived data such as Nt seq Ew seq and macromuleculaire structure. exp resutls are submitted directly into db by researchers
 > once given an Acc => data is nerver changed
 Some examples:
	> ENA: provides a comprehensive record of Nt seq info, covering raw seq data, seq assembly info and functional annotation. 
		> DNA & RNA seq
		> 3 db: SRA, trace archive and EMBL Nt seq db
		> maintained by EBI
		> stored: XML, HTML, FASTA, FASTQ files
	> GenBank: NIH genetic seq db, annotated collection of publicly available DNA seq and their Ew translation
		> 100 000 distinct org
		> maintained by NCBI
		> format: flat file
	> DDBJ: biological db that collects DNA seq 
Secondary db
 = comprise data derived from results of analysing primary data
 > draw info from numerous sources including other db, controlled vocabularies and scientific literature
 > highly curated, using complex combination of computational algorithms and manual analysis and interpretaion to derive knowledge for public records of science
	> RefSeq: ocntains DNA, RNA and their Ew products. it's annotated and curated. there is a single record for each natural bio M
	> OMIM: catolog of human genes and genetic diorders and traits. based on selction and review of published peer reviewed literature
	> HapMap: haplotype map of human genome. it contains genetic variants affecting health, diseases and responses to drugs and evironmental factors
Other Nz db
	> gene expression db: mostly microarry data
		> Gene expression Omnibus
	> gene ontology: relationships between concepts within a domain 
	> genome db: annotated and analyzed genome seq
		> Ensembl
	> phenotype db
		> PhenCode
	> RNA db
		> miRBase
Sequencing db: datasets from seq exp
	> SRA: hosted by NCBI, raw data in BAM-format, data avaible
	> European Genome-phenome Archive: hosted by EMBL-EBI, dat not avaible
Protein db
	> Ew seq: 
		> derived from translation of Nt seq: NCBI protein and trEMBL
		> computional analysis manual review and annotaion: SwissProt
	> Ew structure:
		> PDB, NCBI structure

General Feature Format (GFF)
 = file format used for describing genes and other features of DNA, RNA and Ew seq.
 > file type: tab delimited, text format which is widely accepted for creation and viewing by spreadsheet programs and editor applications 
 > 1 line per feature, each feature most contain a value
	> seqname: name of chromosome or scaffold
	> source: name of the program that generated this feature or data source
	> feature: type name
	> start: start position of feature, with seq nr starting at 1
	> end: end position of feature, with seq nr starting at 1
	> score: a floating . value
	> strand: + or -
	> frame: '0', '1', '2' indicates first base of feature
	> attribute: semicolon separated list of tag-values pairs, providing additional info about each feature
Genome browsers:
 = Graphical interface for genomic data
	> UCSC genome brower: search by gene name and by location
	> Ensemble genome browser: annotated genes aligned to a reference genome
API
 = application programing interface, set of subroutine definitions, protocols and tools for building application software
 > set of clearl defined methods of communication between various software components
 > serves as middle-layer between underlying db schemes and more specific application programs
 > provide access to data tables and isolate applications from data layout changes
 > Within Ensembl are several db
	> core: annotation info for each org
	> compara:
		> cross-species db
		> genome-wide species comparisons
			> DNA-seq level
				> whole genome align
				> sensitive regions
				> conervation scores / constrained elem
			> gene level
				> pylogenetic trees
				> homology predictions
	> varation:
		> areas of genome that differce betweent individual genomes
		> associated disease and phenotype info
		> diffrent typs of variants
			> seq variants
				> SNP
				> insertion
				> deletion
				> indel
				> substitution
			 > structural variants
				> CNV
				> inverion
				> translocation
	> regulation: gene expression and its regulation in human and mouse
REST API
 = representational state transfer or RESTful web servers are a way of providing interoperability between computer systems on the intersnet
 > allow requesting systems ot access and manipulate textual representation of Web resources using uniform and predefined set of stateless operations
 > REST: defines a set of architectural principles by wich you can design Web services that focus on system's resources including how resources states are adressed and transferred over HTTP by wide range of clients written in deffent laguages

GIT track and stor revisons/versions of files
 = the systems think of inf they keep as set of files and chages miad to each file over time 
 > snapshosts 
