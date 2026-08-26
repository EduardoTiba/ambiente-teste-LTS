var right, left, up, down, call;
right	= keyboard_check(ord("D"));
left	= keyboard_check(ord("A"));
up		= keyboard_check(ord("W"));
down	= keyboard_check(ord("S"));
call	= keyboard_check(ord("C"));

hsp = (right - left) * vel;
vsp = (down - up) * vel;

x += hsp;
y += vsp;

if (call)	
{
	//a variável no doggo que controla se ele está seguindo, se torna true
	obj_doggo.seguindo = true;
}