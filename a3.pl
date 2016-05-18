/*Phrase*/

phrase(<u,v>, affirmation(x) ) -> ph_aff(<u,".".v>,x);
phrase(<u,v>,x) -> ph_int(<u,"?".v>,x);

ph_aff(<u,v>,l) -> sujet(<u,w>,g, s) gv(<w,v>,<g,si>,<s,l>);
ph_int(<"est"."-"."ce"."que".u,v>, est_ce_que(l)) -> ph_aff(<u,v>,l);
ph_int(<"qui".u,v >,quel(x,l)) -> gv(<u,v>,<g,n>,<x,l>);

ph_int(<"pourquoi".u,v>,pourquoi(l)) -> sujet(<u,w>,g,s) gv_til(<w,v>,<g,n>,<s,l>);
ph_int(<u,v>,est_ce_que(l)) -> sujet(<u,w>,g,s) gv_til(<w,v>,<g,n>,<s,l>);

ph_int(<"de"."qui".u,v>,que_sais_tu(x,l)) -> sujet(<u,w>,g,s) gv_til_partiel(<w,v>,<g,n>,<s,x,l>);
ph_int(<"que"."sais"."-"."tu".u,u>) ->; 

sujet(<u,v>,g,s) -> nom_pr(<u,v>,g,s);
gv(<u,v>,<g,n>,<s,l>) -> verbe(<u,w>,n) gn(<w,v>,<g,n>,<s,l>);

gv_til(<u,v>,<g,n>,<s,l>) -> verbe(<u,"-".w>,n) pronom(<w,z>,<g,n>) gn(<z,v>,<g,n>,<s,l>);

gv_til_partiel(<u,v>,<g,n>,<s,x,l>) -> verbe(<u,"-".w>,n) pronom(<w,z>,<g,n>) gn_partiel(<z,v>,<g,n>,<s,x,l>);

/*Verbe*/

verbe(<"est".u,u>,si) -> ;
verbe(<"sont".u,u>,pl) ->;

/*Genre*/
/*l*/

gn(<u,v>,<g,n>,<s,nil>)-> nom_pr(<u,v>,g,s)!;

gn(<u,v>,<g,n>,<x,p(x).nil>) -> art_ind(<u,w>,<g,n>)  nom_com1(<w,v>,<g,n>,p);

gn(<u,v>,<g,n>,<x,p(x,y).l>) -> art_def(<u,w>,<g,n>) nom_com2(<w,z>,<g,n>,<p(x,y),x,y>) gp(<z,v>,<y,l>);

gn_partiel(<u,v>,<g,n>,<x,k,p(x,k).nil>) -> art_def(<u,w>,<g,n>) nom_com2(<w,v>,<g,n>,<p(x,k),x>);

/*Article defini*/

art_def(<"le".u,u>,<ma,si>)->;
art_def(<"la".u,u>,<fe,si>)->;
art_def(<"les".u,u>,<fe,pl>)->;
art_def(<"les".u,u>,<ma,pl>)->;
/* Article indifini*/

art_ind(<"un".u,u>,<ma,si>)->;
art_ind(<"une".u,u>,<fe,si>)->;
art_ind(<"des".u,u>,<fe,pl>)->;
art_ind(<"des".u,u>,<ma,pl>)->;

gp(<"de".u,v>,<x,p>) -> gn(<u,v>,<g,n>,<x,p>);

/*Pronom*/

pronom(<"il".u,u>,<ma,si>)->;
pronom(<"elle".u,u>,<fe,si>)->;
pronom(<"ils".u,u>,<ma,pl>)->;
pronom(<"elles".u,u>,<fe,pl>)->;

/*Nom com1*/

nom_com1(<"homme".u,u>,<ma,si>,homme)->;
nom_com1(<"femme".u,u>,<fe,si>,femme)->;
nom_com1(<"hommes".u,u>,<ma,pl>,homme)->;
nom_com1(<"hommes".u,u>,<fe,pl>,femme)->;

/*Nom com2*/

nom_com2(<"pere".u,u>,<ma,si>,<pere(x,y),x,y>) ->;
nom_com2(<"mere".u,u>,<fe,si>,<mere(x,y),x,y>) ->;
nom_com2(<"frere".u,u>,<ma,si>,<frere(x,y),x,y>) ->;
nom_com2(<"freres".u,u>,<ma,pl>,<frere(x,y),x,y>) ->;
nom_com2(<"soeur".u,u>,<fe,si>,<soeur(x,y),x,y>) ->;
nom_com2(<"soeurs".u,u>,<fe,pl>,<soeur(x,y),x,y>)->;
nom_com2(<"fils".u,u>,<ma,si>,<fils(x,y),x,y>) ->;
nom_com2(<"fille".u,u>,<fe,si>,<fille(x,y),x,y>) ->;
nom_com2(<"filles".u,u>,<fe,pl>,<fille(x,y),x,y>) ->;
nom_com2(<"oncle".u,u>,<ma,si>,<oncle(x,y),x,y>) ->;
nom_com2(<"oncles".u,u>,<ma,pl>,<oncle(x,y),x,y>) ->;
nom_com2(<"tante".u,u>,<fe,si>,<tante(x,y),x,y>) ->;
nom_com2(<"tantes".u,u>,<fe,pl>,<tante(x,y),x,y>) ->;
nom_com2(<"cousin".u,u>,<ma,si>,<cousin(x,y),x,y>) ->;

nom_com2(<"cousins".u,u>,<ma,pl>,<cousin(x,y),x,y>) ->;
nom_com2(<"cousine".u,u>,<fe,si>,<cousine(x,y),x,y>) ->;
nom_com2(<"cousines".u,u>,<fe,pl>,<cousine(x,y),x,y>) ->;

nom_com2(<"grand"."-"."pere".u,u>,<ma,si>,<grand_pere(x,y),x,y>) ->;
nom_com2(<"grand"."-"."peres".u,u>,<ma,pl>,<grand_pere(x,y),x,y>) ->;

nom_com2(<"grand"."-"."mere".u,u>,<fe,si>,<grand_mere(x,y),x,y>) ->;
nom_com2(<"grand"."-"."meres".u,u>,<fe,pl>,<grand_mere(x,y),x,y>) ->;

nom_com2(<"petit"."-"."fils".u,u>,<ma,si>,<petit_fils(x,y),x,y>) ->;
nom_com2(<"petits"."-"."fils".u,u>,<ma,pl>,<petit_fils(x,y),x,y>) ->;

nom_com2(<"petite"."-"."fille".u,u>,<fe,si>,<petie_fille(x,y),x,y>) ->;
nom_com2(<"petites"."-"."filles".u,u>,<fe,pl>,<petite_fille(x,y),x,y>) ->;

nom_pr(<"Marie".u,u>,fe,Marie)->;
nom_pr(<"Nina".u,u>,fe,Nina)->;
nom_pr(<"Lea".u,u>,fe,Lea)->;
nom_pr(<"Jade".u,u>,ma,Jade)->;
nom_pr(<"Manon".u,u>,fe,Manon)->;
nom_pr(<"Paul".u,u>,ma,Paul)->;
nom_pr(<"Jean".u,u>,ma,Jean)->;
nom_pr(<"Luc".u,u>,ma,Luc)->;
nom_pr(<"Tom".u,u>,ma,Tom)->;
nom_pr(<"Hugo".u,u>,ma,Hugo)->;

/*predicat forme usuelle*/
forme_usuelle(nil,nil)->;
forme_usuelle("du".l,"de"."le".u) -> !forme_usuelle(l,u);
forme_usuelle("l"."'"."oncle".l,"le"."oncle".u) -> !forme_usuelle(l,u);
forme_usuelle("d"."'"."un".l,"de"."un".u)-> !forme_usuelle(l,u);
forme_usuelle("d"."'"."une".l,"de"."une".u)-> !forme_usuelle(l,u); 
forme_usuelle(u.x,u.y) ->  forme_usuelle(x,y);

/*Moteur de Dialogue*/

go-> 
	line outm("A vous :") 
	in_sentence(s,t) 
	suite(s);

suite("au"."revoir".".".nil)-> ! outml("c'etait un plaisir. Au revoir!");

suite(s)->forme_usuelle(s,v) phrase(<v,nil>,x)! 
	outm("La phrase est correcte. J'obtiens la structure: " )
	outl(x)
	go;

suite(s)->  outml("Desole, je ne comprends pas.")
	go;
