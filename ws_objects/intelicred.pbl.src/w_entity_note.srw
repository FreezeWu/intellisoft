﻿$PBExportHeader$w_entity_note.srw
forward
global type w_entity_note from window
end type
type dw_detail from datawindow within w_entity_note
end type
type dw_prac_notes from datawindow within w_entity_note
end type
type rb_both from radiobutton within w_entity_note
end type
type rb_calls from radiobutton within w_entity_note
end type
type rb_notes from radiobutton within w_entity_note
end type
type cb_filter from commandbutton within w_entity_note
end type
type cb_sort from commandbutton within w_entity_note
end type
type dw_print from datawindow within w_entity_note
end type
type p_1 from picture within w_entity_note
end type
type st_1 from statictext within w_entity_note
end type
type cb_print from commandbutton within w_entity_note
end type
type cb_add from commandbutton within w_entity_note
end type
type cb_close from commandbutton within w_entity_note
end type
type cb_save from commandbutton within w_entity_note
end type
type gb_view from groupbox within w_entity_note
end type
end forward

global type w_entity_note from window
integer x = 73
integer y = 376
integer width = 4247
integer height = 2404
boolean titlebar = true
string title = "Notes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33551856
dw_detail dw_detail
dw_prac_notes dw_prac_notes
rb_both rb_both
rb_calls rb_calls
rb_notes rb_notes
cb_filter cb_filter
cb_sort cb_sort
dw_print dw_print
p_1 p_1
st_1 st_1
cb_print cb_print
cb_add cb_add
cb_close cb_close
cb_save cb_save
gb_view gb_view
end type
global w_entity_note w_entity_note

type variables
integer ii_facid
long il_prac_id //maha 032210
boolean ib_change = False
string is_facil_filter
string is_type_filter
long il_ent_id
string is_ent_type
end variables

forward prototypes
public function integer of_filter ()
end prototypes

public function integer of_filter (); //Start Code Change ----07.08.2013 #V14 maha
string ls_filter
integer r
long n

ls_filter = ""

if len(is_facil_filter ) > 0 then
	ls_filter = is_facil_filter 
else
	ls_filter = ""
end if

if len(is_type_filter ) > 1 then
	if  len(ls_filter ) > 0 then 
		ls_filter+= " and " + is_type_filter
	else
		 ls_filter = is_type_filter 
	end if
end if

dw_detail.reset()
r = dw_prac_notes.setfilter(ls_filter)
if r < 0 then messagebox("Filter Failed",ls_filter)
dw_prac_notes.filter()

if  dw_prac_notes.rowcount() > 0 then
	n = dw_prac_notes.getitemnumber(1,"pd_notes_record_id")
	dw_detail.retrieve(n)
end if

return 1
end function

on w_entity_note.create
this.dw_detail=create dw_detail
this.dw_prac_notes=create dw_prac_notes
this.rb_both=create rb_both
this.rb_calls=create rb_calls
this.rb_notes=create rb_notes
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.dw_print=create dw_print
this.p_1=create p_1
this.st_1=create st_1
this.cb_print=create cb_print
this.cb_add=create cb_add
this.cb_close=create cb_close
this.cb_save=create cb_save
this.gb_view=create gb_view
this.Control[]={this.dw_detail,&
this.dw_prac_notes,&
this.rb_both,&
this.rb_calls,&
this.rb_notes,&
this.cb_filter,&
this.cb_sort,&
this.dw_print,&
this.p_1,&
this.st_1,&
this.cb_print,&
this.cb_add,&
this.cb_close,&
this.cb_save,&
this.gb_view}
end on

on w_entity_note.destroy
destroy(this.dw_detail)
destroy(this.dw_prac_notes)
destroy(this.rb_both)
destroy(this.rb_calls)
destroy(this.rb_notes)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.dw_print)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.cb_print)
destroy(this.cb_add)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.gb_view)
end on

event open; //Start Code Change ----08.26.2015 #V15 maha - modified to browse and detail on same level

//Start Code Change ----09.25.2013 #V14 maha - copied from prac notes and modified for other entities
integer i
integer li_pos
integer li_set
long n
string ls_name
string ls_parm
datawindowchild dwchild

//parm id*from
ls_parm = message.stringparm
li_pos = PosA(ls_parm,"*",1)
il_ent_id = long(MidA(ls_parm, 1,li_pos -1 ))
is_ent_type = MidA(ls_parm, li_pos + 1, LenA(ls_parm) - li_pos  )


 // call log
 li_set = of_get_app_setting("set_call_log","I")

if li_set = 1 then
	gb_view.visible = true
	rb_notes.visible = true
	rb_both.visible = true
	rb_calls.visible = true
end if
debugbreak()
choose case is_ent_type
	case "FAC"
		dw_prac_notes.dataobject = "d_pd_notes_ent_browse_facil"
		select facility_name into :ls_name from facility where facility_id = :il_ent_id;
	case "LOC"
		dw_prac_notes.dataobject = "d_pd_notes_ent_browse_loc"
		select street into :ls_name from group_practice where rec_id = :il_ent_id;
	Case "GRP"
		dw_prac_notes.dataobject = "d_pd_notes_ent_browse_group"
		select gp_name into :ls_name from group_multi_loc where rec_id = :il_ent_id;
	case "PAY"
		dw_prac_notes.dataobject = "d_pd_notes_ent_browse_payor"
		select application_name into :ls_name from app_hdr where app_id = :il_ent_id;
	case "ORG"
		dw_prac_notes.dataobject = "d_pd_notes_ent_browse_organize"
		select facility_name into :ls_name from app_facility where facility_id = :il_ent_id;
end choose

dw_prac_notes.SetTransObject( SQLCA )

i = dw_prac_notes.retrieve(il_ent_id,gs_user_id )


this.title = "Notes for: " + ls_name

//Start Code Change ----09.12.2012 #V12 maha - changed to new setting; added add only functionality
if w_mdi.of_security_access( 7340 ) < 2 then 
//if w_mdi.of_security_access( 40 ) < 2 then
	dw_detail.enabled = false
	//tab_1.tabpage_detail.dw_facil.enabled = false
	cb_add.enabled = false
	cb_save.enabled = false
else
	if  w_mdi.of_security_access( 7350 ) = 0 then //add but no edit
		dw_detail.enabled = false
	end if
end if


if  dw_prac_notes.rowcount() > 0 then
	n = dw_prac_notes.getitemnumber(1,"pd_notes_record_id")
	dw_detail.retrieve(n)
end if	
	
	
end event

event close;//Start Code Change ----10.14.2008 #V85 maha
integer res
string ls_status

dw_detail.accepttext( )
ls_status = of_check_row_status(dw_detail,1)
//messagebox("Status",ls_status)
if ls_status  = "newmod" or ls_status  = "mod" or ls_status  = "new" then
	res = messagebox("Save Data","Do you wish to save the data before closing?",question!,yesno!,1)
	if res = 1 then
		cb_save.triggerevent("clicked")
	end if
end if
end event

type dw_detail from datawindow within w_entity_note
integer x = 59
integer y = 1192
integer width = 4133
integer height = 1084
integer taborder = 30
string dataobject = "d_pd_notes_ent_detail"
boolean livescroll = true
end type

event buttonclicked; //Start Code Change ----07.08.2013 #V14 maha
if dwo.name = "b_log" then
	long ll_id
	w_call_log lw_log
	ll_id = this.getitemnumber(1, "pd_notes_record_id")
	openwithparm  (lw_log, ll_id)
end if
end event

event constructor;this.settransobject(sqlca)
end event

type dw_prac_notes from datawindow within w_entity_note
integer x = 55
integer y = 192
integer width = 4142
integer height = 976
integer taborder = 20
string dataobject = "d_pd_notes_browse"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;integer r
long ll_recid

r = this.setrow(this.getclickedrow())

if r < 1 then return

ll_recid = this.getitemnumber(row,"pd_notes_record_id")
ib_change = false

dw_detail.retrieve(ll_recid)

//Start Code Change ----09.12.2012 #V12 maha
if  w_mdi.of_security_access( 7350 ) = 0 then //add but no edit
	dw_detail.enabled = false
end if
end event

event constructor;this.SetRowFocusIndicator ( p_1)  //Start Code Change ----12.04.2009 #V92 maha - changed indicator
end event

event doubleclicked;long ll_recid
datawindowchild dwchild

//if this.getclickedrow() < 1 then return
//
//ll_recid = this.getitemnumber(row,"pd_notes_record_id")
//ib_change = false
//tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
//tab_1.tabpage_detail.dw_detail.retrieve(ll_recid)
//tab_1.tabpage_detail.dw_detail.GetChild( "pd_notes_facility_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( gs_user_id)
//tab_1.tabpage_detail.dw_facil.settransobject(sqlca)
//tab_1.tabpage_detail.dw_facil.insertrow(1)
//tab_1.tabpage_detail.dw_facil.GetChild( "facility_facility_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( gs_user_id)
////tab_1.tabpage_detail.dw_facil.retrieve()
//dwchild.insertrow(1)
//dwchild.setitem(1,"facility_facility_id",0)
//dwchild.setitem(1,"facility_facility_name","Global")

//tab_1.selecttab(2)
end event

type rb_both from radiobutton within w_entity_note
boolean visible = false
integer x = 2089
integer y = 80
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long backcolor = 33551856
string text = "Both"
boolean checked = true
end type

event clicked;is_type_filter = ""
of_filter()
end event

type rb_calls from radiobutton within w_entity_note
boolean visible = false
integer x = 1646
integer y = 80
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long backcolor = 33551856
string text = "Contact Logs"
end type

event clicked;is_type_filter = " note_type = 2 "
of_filter()
end event

type rb_notes from radiobutton within w_entity_note
boolean visible = false
integer x = 1339
integer y = 80
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long backcolor = 33551856
string text = "Notes"
end type

event clicked;is_type_filter = " note_type = 1 "
of_filter()
end event

type cb_filter from commandbutton within w_entity_note
integer x = 2651
integer y = 36
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Filter"
end type

event clicked;string null_str

SetNull(null_str)

dw_prac_notes.SetFilter(null_str)

dw_prac_notes.Filter()
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.12.2006 By: LeiWei
//$<reason> Due to one slight defect in Appeon product, the position of this button is incorrect to some degree after migration.
//$<modification> Adjust the position for this button to make sure the presentation of this button looks the same as in PowerBuilder.
//If appeongetclienttype() <> 'PB' Then
//	this.y += 12
//End If
//---------------------------- APPEON END ----------------------------

end event

type cb_sort from commandbutton within w_entity_note
integer x = 2921
integer y = 36
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Sort"
end type

event clicked;string null_str

SetNull(null_str)

dw_prac_notes.Setsort(null_str)

dw_prac_notes.sort()
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 01.12.2006 By: LeiWei
//$<reason> Due to one slight defect in Appeon product, the position of this button is incorrect to some degree after migration.
//$<modification> Adjust the position for this button to make sure the presentation of this button looks the same as in PowerBuilder.
//If appeongetclienttype() <> 'PB' Then
//	this.y += 12
//End If
//---------------------------- APPEON END ----------------------------

end event

type dw_print from datawindow within w_entity_note
boolean visible = false
integer x = 4265
integer y = 180
integer width = 110
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "d_pd_notes_browse_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_entity_note
boolean visible = false
integer x = 4283
integer y = 180
integer width = 82
integer height = 60
boolean originalsize = true
string picturename = "arrowhead.png"
boolean focusrectangle = false
end type

type st_1 from statictext within w_entity_note
boolean visible = false
integer x = 2546
integer y = 120
integer width = 841
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 33551856
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_entity_note
integer x = 3433
integer y = 36
integer width = 247
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Print"
end type

event clicked;//Start Code Change ----10.03.2011 #V12 maha - modify to show print dialog box`
boolean lb_dialog = false

if gi_print_dialog = 1 then
	lb_dialog = true
end if

cb_save.triggerevent(clicked!)

//-------Begin Added by Alfee 01.05.2012 -----------
//<$Reason>The ShowPrintDialog argument specified in the Print function is unsupported 
//<$Reason>and will cause the Print function failed in a Web application.
if appeongetclienttype() <> "PB" then	//Web version
	if lb_dialog then
		if PrintSetup () <> 1 then return
	end if
//	if tab_1.selectedtab = 1 then
//		dw_print.dataobject = "d_pd_notes_browse_print"
//		dw_print.settransobject(sqlca)
//		dw_prac_notes.sharedata( dw_print)
//		//tab_1.tabpage_browse.dw_prac_notes.print(true)
//		dw_print.print(true)
//	else
//		dw_print.dataobject = "d_pd_notes_browse_print"
//		dw_print.settransobject(sqlca)
//		tdw_detail.sharedata( dw_print)
//		//tab_1.tabpage_detail.dw_detail.print(true)
//		dw_print.print(true)
//	end if
	return 
end if
//--------End Added -------------------------------------

//if tab_1.selectedtab = 1 then
//	dw_print.dataobject = "d_pd_notes_browse_print"
//	dw_print.settransobject(sqlca)
//	tab_1.tabpage_browse.dw_prac_notes.sharedata( dw_print)
//	//tab_1.tabpage_browse.dw_prac_notes.print(true,lb_dialog)
//	dw_print.print(true,lb_dialog)
//else
//	dw_print.dataobject = "d_pd_notes_browse_print"
//	dw_print.settransobject(sqlca)
//	tab_1.tabpage_detail.dw_detail.sharedata( dw_print)
////	tab_1.tabpage_detail.dw_detail.print(true,lb_dialog)
//	dw_print.print(true,lb_dialog)
//end if



//End Code Change ----10.03.2011
end event

type cb_add from commandbutton within w_entity_note
integer x = 3177
integer y = 36
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Add"
end type

event clicked;datawindow ldw_detail

ldw_detail = dw_detail

//tab_1.selecttab(2)

cb_save.triggerevent(clicked!)
ldw_detail.reset()

ldw_detail.insertrow(1)

choose case is_ent_type
	case "GRP"
		ldw_detail.setitem(1,"pd_notes_group_id", il_ent_id )
	case "LOC"
		ldw_detail.setitem(1,"pd_notes_location_id", il_ent_id)
	case "FAC"
		ldw_detail.setitem(1,"pd_notes_facility_id", il_ent_id)
	case "PAY"
		ldw_detail.setitem(1,"pd_notes_payor_id", il_ent_id)
	case "ORG"
		ldw_detail.setitem(1,"pd_notes_org_id", il_ent_id)
end choose
//ldw_detail.setitem(1,"record_id",)
ldw_detail.setitem(1,"pd_notes_prac_id", 0)
ldw_detail.setitem(1, "note_type", 1)	  //Start Code Change ----11.18.2013 #V14 maha

ldw_detail.setitem(1,"pd_notes_ent_date",datetime(today(),now()))
ldw_detail.setitem(1,"pd_notes_user_id",gs_user_id)

if is_ent_type <> "FAC" then //Start Code Change ----11.04.2013 #V14 maha
	ldw_detail.setitem(1,"pd_notes_facility_id",0)
end if
ldw_detail.setfocus()

if  w_mdi.of_security_access( 7350 ) = 0 then //add but no edit
	ldw_detail.enabled = true
end if
end event

type cb_close from commandbutton within w_entity_note
integer x = 3945
integer y = 36
integer width = 247
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Close"
end type

event clicked;Close (Parent)
end event

type cb_save from commandbutton within w_entity_note
integer x = 3689
integer y = 36
integer width = 247
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Save"
end type

event clicked;long recid

if dw_detail.rowcount() < 1 then return

//set rec_id
if isnull(dw_detail.getitemnumber(1,"pd_notes_record_id")) then
	select max(record_id)
	into :recid
	from pd_notes;
	
	if recid < 1 or isnull(recid) then recid = 0
	//messagebox("",recid)
	recid++

	dw_detail.setitem(1,"pd_notes_record_id",recid)
else
	recid = dw_detail.getitemnumber(1,"pd_notes_record_id")
end if

//if ib_change = true then
//	dw_detail.setitem(1,"pd_notes_facility_id",ii_facid)
//end if
//Start Code Change ----11.06.2013 #V14 maha
if isnull(dw_detail.getitemnumber(1,"pd_notes_prac_id")) then dw_detail.setitem(1,"pd_notes_prac_id",0)
if isnull(dw_detail.getitemnumber(1,"pd_notes_facility_id")) then dw_detail.setitem(1,"pd_notes_facility_id",0)
//End Code Change ----11.06.2013

dw_detail.settransobject(sqlca)

gnv_appeondb.of_autocommitrollback( )

if dw_detail.Update() = 1 then
	commit using sqlca;
else
	Rollback;
	if sqlca.SQLCode < 0 then
		messagebox("Rollback","Unable to Rollback changes",Exclamation!)
	end if
end if

dw_prac_notes.retrieve(il_ent_id,gs_user_id )  //added by long.zhang appeon 12.05.2013 refresh issue BugL112901 

gnv_appeondb.of_startqueue( )

//dw_detail.retrieve(recid)
//tab_1.tabpage_browse.dw_prac_notes.retrieve(il_prac_id,gs_user_id) 

gnv_appeondb.of_commitqueue( )

//Start Code Change ----09.12.2012 #V12 maha
if  w_mdi.of_security_access( 7350 ) = 0 then //add but no edit
	dw_detail.enabled = false
end if

end event

type gb_view from groupbox within w_entity_note
boolean visible = false
integer x = 1280
integer y = 16
integer width = 1221
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 128
long backcolor = 33551856
string text = "View"
end type

