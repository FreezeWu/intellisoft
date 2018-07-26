﻿$PBExportHeader$w_appeon_wait.srw
forward
global type w_appeon_wait from window
end type
type hpb_1 from hprogressbar within w_appeon_wait
end type
type st_1 from statictext within w_appeon_wait
end type
type p_1 from picture within w_appeon_wait
end type
end forward

global type w_appeon_wait from window
integer width = 1632
integer height = 316
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
hpb_1 hpb_1
st_1 st_1
p_1 p_1
end type
global w_appeon_wait w_appeon_wait

type variables
long il_count
end variables

forward prototypes
public function integer of_settext (string as_describe)
public function integer of_setminposition (long al_minposition)
public function integer of_setmaxposition (long al_maxposition)
public function integer of_setposition (long al_position)
public function integer of_setstep (long al_step)
public function integer of_skipnextposition (long al_setp)
end prototypes

public function integer of_settext (string as_describe);//////////////////////////////////////////////////////////////////////
// $<function>of_settext
// $<arguments>
// $		as_describe
// $<returns> integer
// $<description> Set text
//////////////////////////////////////////////////////////////////////
// $<add> 10.23.2007 by Evan
//////////////////////////////////////////////////////////////////////

st_1.Text = as_Describe

Return 1
end function

public function integer of_setminposition (long al_minposition);//////////////////////////////////////////////////////////////////////
// $<function>of_setminposition
// $<arguments>
// $		al_minposition
// $<returns> integer
// $<description> Set min position
//////////////////////////////////////////////////////////////////////
// $<add> 10.23.2007 by Evan
//////////////////////////////////////////////////////////////////////

hpb_1.MinPosition = al_MinPosition

Return 1
end function

public function integer of_setmaxposition (long al_maxposition);//////////////////////////////////////////////////////////////////////
// $<function>of_setmaxposition
// $<arguments>
// $		al_maxposition
// $<returns> integer
// $<description> Set max position
//////////////////////////////////////////////////////////////////////
// $<add> 10.23.2007 by Evan
//////////////////////////////////////////////////////////////////////

hpb_1.MaxPosition = al_MaxPosition

Return 1
end function

public function integer of_setposition (long al_position);//////////////////////////////////////////////////////////////////////
// $<function>of_setposition
// $<arguments>
// $		al_position
// $<returns> integer
// $<description> Set position
//////////////////////////////////////////////////////////////////////
// $<add> 10.23.2007 by Evan
//////////////////////////////////////////////////////////////////////

hpb_1.Position = al_Position

Return 1
end function

public function integer of_setstep (long al_step);//////////////////////////////////////////////////////////////////////
// $<function>of_setstep
// $<arguments>
// $		al_step
// $<returns> integer
// $<description> Set step
//////////////////////////////////////////////////////////////////////
// $<add> 10.23.2007 by Evan
//////////////////////////////////////////////////////////////////////

hpb_1.SetStep = al_Step

Return 1
end function

public function integer of_skipnextposition (long al_setp);//////////////////////////////////////////////////////////////////////
// $<function>of_skipnextposition()
// $<arguments>
// $		al_setp
// $<returns> integer
// $<description> Skip next position
//////////////////////////////////////////////////////////////////////
// $<add> 10.23.2007 by Evan
//////////////////////////////////////////////////////////////////////

hpb_1.Position += al_Setp

Return 1
end function

event open;IF LenA(Message.StringParm) > 0 THEN
	st_1.Text = Message.StringParm
END IF

// Add by Davis 10.18.2006
Timer(1)

SetPointer( HourGlass! )
end event

on w_appeon_wait.create
this.hpb_1=create hpb_1
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.hpb_1,&
this.st_1,&
this.p_1}
end on

on w_appeon_wait.destroy
destroy(this.hpb_1)
destroy(this.st_1)
destroy(this.p_1)
end on

event timer;// Add by Davis 10.18.2006
hpb_1.stepit( )
il_count++
if il_count=10 then 
	timer(0)
	close(this)
end if
	

end event

event closequery;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.07.2007 By: Machongmin
//$<reason> Fix a defect.
this.hpb_1.position = 100
//---------------------------- APPEON END ----------------------------
end event

type hpb_1 from hprogressbar within w_appeon_wait
integer x = 41
integer y = 192
integer width = 1554
integer height = 64
unsignedinteger maxposition = 100
unsignedinteger position = 10
integer setstep = 10
end type

type st_1 from statictext within w_appeon_wait
integer x = 224
integer y = 64
integer width = 1993
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opening document..."
boolean focusrectangle = false
end type

type p_1 from picture within w_appeon_wait
integer x = 41
integer y = 20
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "searchapp.gif"
boolean focusrectangle = false
end type

