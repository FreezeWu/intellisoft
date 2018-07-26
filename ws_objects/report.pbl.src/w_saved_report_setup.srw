$PBExportHeader$w_saved_report_setup.srw
forward
global type w_saved_report_setup from w_popup
end type
type cb_access from commandbutton within w_saved_report_setup
end type
type cb_add from commandbutton within w_saved_report_setup
end type
type cb_delete from commandbutton within w_saved_report_setup
end type
type cb_save from commandbutton within w_saved_report_setup
end type
type cb_close from commandbutton within w_saved_report_setup
end type
type dw_detail from u_dw within w_saved_report_setup
end type
type dw_browse from u_dw within w_saved_report_setup
end type
end forward

global type w_saved_report_setup from w_popup
integer width = 3141
integer height = 2404
string title = "Saved Report Setup"
long backcolor = 33551856
cb_access cb_access
cb_add cb_add
cb_delete cb_delete
cb_save cb_save
cb_close cb_close
dw_detail dw_detail
dw_browse dw_browse
end type
global w_saved_report_setup w_saved_report_setup

on w_saved_report_setup.create
int iCurrent
call super::create
this.cb_access=create cb_access
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_close=create cb_close
this.dw_detail=create dw_detail
this.dw_browse=create dw_browse
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_access
this.Control[iCurrent+2]=this.cb_add
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.dw_detail
this.Control[iCurrent+7]=this.dw_browse
end on

on w_saved_report_setup.destroy
call super::destroy
destroy(this.cb_access)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.dw_detail)
destroy(this.dw_browse)
end on

event open;call super::open;

dw_browse.retrieve()
end event

type cb_access from commandbutton within w_saved_report_setup
integer x = 5
integer y = 28
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&User Access"
end type

event clicked;open(w_saved_report_user_access)
end event

type cb_add from commandbutton within w_saved_report_setup
integer x = 1865
integer y = 28
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Add"
end type

type cb_delete from commandbutton within w_saved_report_setup
integer x = 2281
integer y = 28
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Delete"
end type

type cb_save from commandbutton within w_saved_report_setup
integer x = 1454
integer y = 28
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Save"
end type

type cb_close from commandbutton within w_saved_report_setup
integer x = 2688
integer y = 28
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

type dw_detail from u_dw within w_saved_report_setup
integer x = 5
integer y = 1784
integer width = 3090
integer height = 504
integer taborder = 10
string dataobject = "d_reports_saved_detail"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;call super::constructor;this.of_settransobject( sqlca)
end event

type dw_browse from u_dw within w_saved_report_setup
integer y = 140
integer width = 3095
integer height = 1640
integer taborder = 10
string dataobject = "d_reports_saved_browse"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.of_setupdateable( false)
this.of_settransobject( sqlca)
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_id

if currentrow < 1 then return

ll_id = this.getitemnumber(currentrow, "srs_id")

dw_detail.retrieve(ll_id)
end event

