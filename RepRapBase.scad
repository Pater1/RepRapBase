use<write\write.scad>

x = 558;
y = 558;
zFront = 101;
zBack = 152;
fold = 0;



//----------------------------------------------
	color("green") base();	
	if(fold){
		translate([-x/2,0,0]){rotate([0,90,0]){leftSide();}}
		translate([x/2,0,0]){rotate([0,-90,0]){rightSide();}}
		translate([0,-y/2,0]){rotate([-90,0,0]){front();}}
		translate([0,y/2,0]){rotate([90,0,0]){back();}}
	}
	else{
		translate([-x/2,0,0]){leftSide();}
		translate([x/2,0,0]){rightSide();}
		translate([0,-y/2,0]){front();}
		translate([0,y/2,0]){back();}
	}
	
//----------------------------------------------	
module base(){
	polygon(points=[[-x/2,-y/2],[-x/2,y/2],[x/2,y/2],[x/2,-y/2]],paths = [[0,1,2,3]]);
}

module leftSide(){
	polygon(points=[[0,-y/2],[0,y/2],[-zBack,y/2],[-zFront,-y/2]],paths = [[0,1,2,3]]);
}	
	
module rightSide(){
	polygon(points=[[0,-y/2],[0,y/2],[zBack,y/2],[zFront,-y/2]],paths = [[0,1,2,3]]);
}
module front(){
	difference(){
		polygon(points=[[-x/2,0],[x/2,0],[x/2,-zFront],[-x/2,-zFront]],paths = [[0,1,2,3]]);
			rotate([0,180,180]) translate([-150,25,-5]) label();
	}
}
module back(){
	polygon(points=[[-x/2,0],[x/2,0],[x/2,zBack],[-x/2,zBack]],paths = [[0,1,2,3]]);
}

module powerPlug(){

}

module label(){
	write("JOAT Labs", h=60, t=10, font = "orbitron.dxf");
}