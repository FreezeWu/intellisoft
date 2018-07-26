$PBExportHeader$w_saved_reports.srw
forward
global type w_saved_reports from w_popup
end type
type cb_filter from commandbutton within w_saved_reports
end type
type cb_sort from commandbutton within w_saved_reports
end type
type cb_access from commandbutton within w_saved_reports
end type
type cb_close from commandbutton within w_saved_reports
end type
type dw_browse from u_dw within w_saved_reports
end type
end forward

global type w_saved_reports from w_popup
integer width = 4352
integer height = 1940
string title = "Saved Reports"
long backcolor = 33551856
cb_filter cb_filter
cb_sort cb_sort
cb_access cb_access
cb_close cb_close
dw_browse dw_browse
end type
global w_saved_reports w_saved_reports

on w_saved_reports.create
int iCurrent
call super::create
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.cb_access=create cb_access
this.cb_close=create cb_close
this.dw_browse=create dw_browse
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_filter
this.Control[iCurrent+2]=this.cb_sort
this.Control[iCurrent+3]=this.cb_access
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_browse
end on

on w_saved_reports.destroy
call super::destroy
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.cb_access)
destroy(this.cb_close)
destroy(this.dw_browse)
end on

event open;call super::open;

dw_browse.retrieve()
//dw_browse.retrieve(gs_user_id)
end event

event pfc_preopen;call super::pfc_preopen;this.of_SetResize(TRUE)
this.inv_resize.of_SetOrigSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
this.inv_resize.of_SetMinSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())

this.inv_resize.of_register(dw_browse,inv_resize.scalerightbottom)
end event

type cb_filter from commandbutton within w_saved_reports
integer x = 430
integer y = 20
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Filter"
end type

type cb_sort from commandbutton within w_saved_reports
integer x = 18
integer y = 20
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Sort"
end type

type cb_access from commandbutton within w_saved_reports
integer x = 1815
integer y = 20
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&View Report"
end type

type cb_close from commandbutton within w_saved_reports
integer x = 3872
integer y = 32
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Close"
end type

event clicked;close(parent)
end event

type dw_browse from u_dw within w_saved_reports
integer y = 140
integer width = 4315
integer height = 1692
integer taborder = 10
string dataobject = "d_sys_reports_store_files_browse"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.of_setupdateable( false)
this.of_settransobject( sqlca)
end event

event clicked;call super::clicked;this.setrow(row)
end event

