$PBExportHeader$w_custom_report_manage.srw
forward
global type w_custom_report_manage from w_popup
end type
type cb_save from commandbutton within w_custom_report_manage
end type
type cb_sort from commandbutton within w_custom_report_manage
end type
type cb_export from commandbutton within w_custom_report_manage
end type
type cb_close from commandbutton within w_custom_report_manage
end type
type dw_1 from datawindow within w_custom_report_manage
end type
end forward

global type w_custom_report_manage from w_popup
integer width = 3502
integer height = 2248
long backcolor = 33551856
cb_save cb_save
cb_sort cb_sort
cb_export cb_export
cb_close cb_close
dw_1 dw_1
end type
global w_custom_report_manage w_custom_report_manage

on w_custom_report_manage.create
int iCurrent
call super::create
this.cb_save=create cb_save
this.cb_sort=create cb_sort
this.cb_export=create cb_export
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_save
this.Control[iCurrent+2]=this.cb_sort
this.Control[iCurrent+3]=this.cb_export
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_1
end on

on w_custom_report_manage.destroy
call super::destroy
destroy(this.cb_save)
destroy(this.cb_sort)
destroy(this.cb_export)
destroy(this.cb_close)
destroy(this.dw_1)
end on

event open;call super::open;dw_1.settransobject(sqlca)
//dw_1.retrieve()
dw_1.retrieve(gs_user_id)  //Modified by (Appeon)Harry 08.03.2016 for BugH072803--------
end event

type cb_save from commandbutton within w_custom_report_manage
integer x = 2021
integer y = 36
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;dw_1.update()
end event

type cb_sort from commandbutton within w_custom_report_manage
integer x = 2373
integer y = 36
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort"
end type

event clicked;string null_str

SetNull(null_str)

dw_1.SetSort(null_str)

dw_1.Sort( )
end event

type cb_export from commandbutton within w_custom_report_manage
integer x = 2729
integer y = 36
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Export"
end type

event clicked;dw_1.saveas()
end event

type cb_close from commandbutton within w_custom_report_manage
integer x = 3072
integer y = 36
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_custom_report_manage
integer y = 152
integer width = 3465
integer height = 1988
integer taborder = 10
string title = "none"
string dataobject = "d_cust_report_list_manage"
boolean vscrollbar = true
boolean livescroll = true
end type

