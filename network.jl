using PhyloNetworks;    
using CSV, DataFrames;     

CF=readTableCF("/home/maccamp/fish-lake/network/network-nq2-btsp-1000snps.csv");    

using PhyloPlots;    
treefile = joinpath("/home/maccamp/fish-lake/network/tree-lahontan.tre");
tree = readTopology(treefile);     
#plot(tree, :R, showEdgeLength=true);

T=readTopologyLevel1(treefile);    

# Using snaq!
net0 = snaq!(T,CF, hmax=0, filename="/home/maccamp/fish-lake/outputs/107/network/net0", seed=1234, runs=10);      
writeTopology(net0, "/home/maccamp/fish-lake/outputs/107/network/bestnet-h0.tre")

using RCall      
imagefilename = "outputs/107/network/snaqplot-net0.pdf"
R"pdf"(imagefilename, width=4, height=3) 
R"par"(mar=[0,0,0,0]) 
plot(net0, showgamma=true, showedgenumber=true);
R"dev.off()"; 


#can use best net0 as a starting place
net1 = snaq!(net0,CF, hmax=1, filename="/home/maccamp/fish-lake/outputs/107/network/net1", seed=1234);  
writeTopology(net1, "/home/maccamp/fish-lake/outputs/107/network/bestnet-h1.tre")

using RCall     
imagefilename = "outputs/107/network/snaqplot-net1.pdf"
R"pdf"(imagefilename, width=4, height=3) 
R"par"(mar=[0,0,0,0]) 
plot(net1, showgamma=true, showedgenumber=true); 
R"dev.off()"; 

net2 = snaq!(net1,CF, hmax=2, filename="/home/maccamp/fish-lake/outputs/107/network/net2", seed=1234);      
writeTopology(net2, "/home/maccamp/fish-lake/outputs/107/network/bestnet-h2.tre")

using RCall      
imagefilename = "outputs/107/network/snaqplot-net2.pdf"
R"pdf"(imagefilename, width=4, height=3) 
R"par"(mar=[0,0,0,0]) # to reduce margins 
plot(net2, showgamma=true, showedgenumber=true);
R"dev.off()"; 


net3 = snaq!(net2,CF, hmax=3, filename="/home/maccamp/fish-lake/outputs/107/network/net3", seed=1234);      
writeTopology(net3, "/home/maccamp/fish-lake/outputs/107/network/bestnet-h3.tre")

using RCall      
imagefilename = "outputs/107/network/snaqplot-net3.pdf"
R"pdf"(imagefilename, width=4, height=3) 
R"par"(mar=[0,0,0,0]) # to reduce margins 
plot(net4, showgamma=true, showedgenumber=true);
R"dev.off()"; 


net4 = snaq!(net3,CF, hmax=4, filename="/home/maccamp/fish-lake/outputs/107/network/net4", seed=1234);      
writeTopology(net4, "/home/maccamp/fish-lake/outputs/107/network/bestnet-h4.tre")

using RCall      
imagefilename = "outputs/107/network/snaqplot-net4.pdf"
R"pdf"(imagefilename, width=4, height=3) 
R"par"(mar=[0,0,0,0]) # to reduce margins 
plot(net4, showgamma=true, showedgenumber=true);
R"dev.off()"; 


net5 = snaq!(net4,CF, hmax=5, filename="/home/maccamp/fish-lake/outputs/107/network/net5", seed=1234);      
writeTopology(net5, "/home/maccamp/fish-lake/outputs/107/network/bestnet-h5.tre")

using RCall      
imagefilename = "outputs/107/network/snaqplot-net5.pdf"
R"pdf"(imagefilename, width=4, height=3) 
R"par"(mar=[0,0,0,0]) # to reduce margins 
plot(net5, showgamma=true, showedgenumber=true);
R"dev.off()"; 


scores = [net0.loglik, net1.loglik, net2.loglik, net3.loglik, net4.loglik, net5.loglik]
hmax = collect(0:5)

using RCall      
imagefilename1 = "outputs/107/network/hscores.pdf"
R"pdf"(imagefilename1, width=4, height=3) 
R"par"(mar=[0,0,0,0]) 
R"plot"(hmax, scores, type="b", ylab="network score", xlab="hmax", col="blue");
R"dev.off()";

exit()
