use<write\write.scad>

x = 558;
y = 558;
zFront = 101;
zBack = 152;
fold = 0; //if left folded, F6 render will still flatten for DXF export!


linear_extrude(height=2) total();

//----------------------------------------------
module total(){	
	color("lightgray") 
	base();	
	color("darkgray"){
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
	}}
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
			rotate([0,180,180]) translate([-150,25]) label();
	}
} 
module back(){
	difference(){
		polygon(points=[[-x/2,0],[x/2,0],[x/2,zBack],[-x/2,zBack]],paths = [[0,1,2,3]]);
		translate([220,20])powerPlug();
	}
}

module powerPlug(){
 //	http://www.mouser.com/ProductDetail/Schurter/DC110001203/?qs=sGAEpiMZZMslPglT%2fXeKq3zfIwGLj0wUxwCHeiKnWN0%3d
	scale([1.33468,1.334658]) import("powerplug.dxf", layer = "panel");
 }



module label(){
	import("label.dxf", layer = "layer");
}