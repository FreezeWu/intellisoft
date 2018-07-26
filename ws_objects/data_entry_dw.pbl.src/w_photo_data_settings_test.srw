$PBExportHeader$w_photo_data_settings_test.srw
forward
global type w_photo_data_settings_test from w_popup
end type
type cb_close from commandbutton within w_photo_data_settings_test
end type
type dw_data from u_dw within w_photo_data_settings_test
end type
end forward

global type w_photo_data_settings_test from w_popup
integer x = 214
integer y = 221
integer width = 1019
integer height = 1752
long backcolor = 33551856
cb_close cb_close
dw_data dw_data
end type
global w_photo_data_settings_test w_photo_data_settings_test

on w_photo_data_settings_test.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_data=create dw_data
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_data
end on

on w_photo_data_settings_test.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_data)
end on

type cb_close from commandbutton within w_photo_data_settings_test
integer x = 663
integer y = 24
integer width = 297
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Close"
end type

event clicked;close(parent)
end event

type dw_data from u_dw within w_photo_data_settings_test
integer x = 14
integer y = 128
integer width = 942
integer height = 1496
integer taborder = 10
string dataobject = "d_personal_data_new"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.settransobject(sqlca)
this.retrieve()
end event

