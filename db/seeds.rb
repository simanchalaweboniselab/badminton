# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
area = Area.create(:name => "Akurdi", :langitude => "73.8710766", :latitude => "18.5233427")
area = Area.create(:name => "Aundh", :langitude => "73.8095574", :latitude => "18.5574017")
area.courts.create([{:name => "Sindh co-operative housing society", :address => "Sindh co-operative housing society"},{:name => "Kubera Bahar Society Pune", :address => "Survey No 131/2 Pashan Baner Link Road Opposite Kubera Bahar Society Pune"}])

area = Area.create(:name => "Baner", :langitude => "", :latitude => "")

area = Area.create(:name => "Balevadi", :langitude => "73.7683784", :latitude => "18.5825868")
area.courts.create(:name => "Balewadi Sports Complex", :address => "Balewadi Sports Complex")

area = Area.create(:name => "Bavdhan", :langitude => "73.7654297", :latitude => "18.5825868")

area = Area.create(:name => "Chinchwad (East)", :langitude => "73.8037489", :latitude => "18.618679")
area.courts.create(:name => "Chapekar Chowk, Chinchwad", :address => " Chapekar Chowk, Chinchwad")

area = Area.create(:name => "Deccan Gymkhana", :langitude => "73.84043599", :latitude => "18.5183409")
area.courts.create(:name => "PYC Gymkhana, Deccan", :address => "PYC Gymkhana, Deccan")
area = Area.create(:name => "Hadapsar", :langitude => "73.9242251", :latitude => "18.5011464")
area = Area.create(:name => "Katraj", :langitude => "73.8610191", :latitude => "18.4567763")
area = Area.create(:name => "Khadaki", :langitude => "73.859549", :latitude => "18.5704162")
area = Area.create(:name => "Khadakwasala", :langitude => "73.7566114", :latitude => "18.4548705")

area = Area.create(:name => "Kothrud", :langitude => "73.8124983999999", :latitude => "18.5087016")
area.courts.create([{:name => "solaris", :address => "Solaris 128/2 Mayur Colony, Behind Jog School, Off Karve Road, Kothrud, Pune - 411029"},{:name => "Prashant Sabhagruha & Badminton Court", :address => "Prashant Sabhagruha & Badminton Court, Prashant Society, Paud Road, Kothrud, Pune - 411038"}])
area = Area.create(:name => "Lohgaon", :langitude => "73.924749", :latitude => "18.595801")
area = Area.create(:name => "Market Yard / Gultekadi", :langitude => "73.8668996", :latitude => "18.4947264")
area.courts.create(:name => "Maharashtra mandal Badminton hall", :address => "Maharashtra mandal Badminton hall Seth Dagaduram Kataria High School Gultekdi, Mukund Nagar Pune, Maharashtra")

area = Area.create(:name => "Model Colony", :langitude => "73.8397009", :latitude => "18.5319571")
area = Area.create(:name => "Koregaon Park", :langitude => "73.8918896", :latitude => "18.535787")
area.courts.create(:name => "Solaris Club", :address => "Solaris Club Off Koregaon Park Mundhwa Road Pune")
area = Area.create(:name => "Pashan", :langitude => "73.782938", :latitude => "18.53836")
area.courts.create(:name => "Symphony club", :address => "Symphony club 131/2, Opp Balaji Temple Lane, Pashan Baner Link Road ,Off Sus Road, Pashan Gaon, Pune - 411021")

area = Area.create(:name => "Pimple Gurav", :langitude => "73.822198899", :latitude => "18.6026262")
area.courts.create(:name => "Katepuram Chowk, Pimple Gurav", :address => "Katepuram Chowk, Pimple Gurav")
area = Area.create(:name => "Senapati Bapat Road", :langitude => "73.83834279", :latitude => "18.5429123")
area.courts.create(:name => "Shivaji ngr Housng Society", :address => "Shivaji ngr Housng Society, post office")
area = Area.create(:name => "Shivajinagar ", :langitude => "73.8474647", :latitude => "18.5011464")
area.courts.create([{:name => "PYC Hindu Gymkhana", :address => "PYC Hindu Gymkhana Survey No 244 Cts No 766, Next To Lord Krishna Opposite Girikand Travels, Bhandarkar Road Goodluck Hotel Lane, Shivaji Nagar, Pune - 411005 | "},{:name => "PDMBA Pe Societys Modern Complex Badminton Courts", :address => "PDMBA Pe Societys Modern Complex Badminton Courts, Behind Modern High School, Shivaji Nagar, Pune - 411005 "},{:name => "COEP, ShivajiNagar", :address => "COEP, ShivajiNagar"}])

area = Area.create(:name => "Swargate", :langitude => "73.8668996", :latitude => "18.5004866")
area.courts.create([{:name => "Sahakar Nagar Tulshibagwale Colony ", :address => "Sahakar Nagar Tulshibagwale Colony "},{:name => " Sahakar Nagar, Some School Near Aranyeshwar Mandir | Hard Flooring With Coating ", :address => " Sahakar Nagar, Some School Near Aranyeshwar Mandir | Hard Flooring With Coating "}, {:name => "Maharashtra Mandal, Agashe CollegeMukund Nagar", :address => "Maharashtra Mandal, Agashe CollegeMukund Nagar"}, {:name => "Heerabaug Sports Complex , Swargate ", :address => "Heerabaug Sports Complex , Swargate "}])
area = Area.create(:name => "Sadashiv Peth", :langitude => "73.8448469", :latitude => "18.5086456")
area.courts.create(:name => "Maharashtra Mandal, Sadashiv Peth", :address => "Maharashtra Mandal, Sadashiv Peth")
