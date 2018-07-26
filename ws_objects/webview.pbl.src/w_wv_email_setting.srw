$PBExportHeader$w_wv_email_setting.srw
forward
global type w_wv_email_setting from window
end type
type dw_detail from datawindow within w_wv_email_setting
end type
type cb_close from commandbutton within w_wv_email_setting
end type
type cb_save from commandbutton within w_wv_email_setting
end type
end forward

global type w_wv_email_setting from window
integer width = 2487
integer height = 1048
boolean titlebar = true
string title = "WebView Email Setting"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 33551856
string icon = "AppIcon!"
boolean center = true
dw_detail dw_detail
cb_close cb_close
cb_save cb_save
end type
global w_wv_email_setting w_wv_email_setting

on w_wv_email_setting.create
this.dw_detail=create dw_detail
this.cb_close=create cb_close
this.cb_save=create cb_save
this.Control[]={this.dw_detail,&
this.cb_close,&
this.cb_save}
end on

on w_wv_email_setting.destroy
destroy(this.dw_detail)
destroy(this.cb_close)
destroy(this.cb_save)
end on

event open;//added by long.zhang appeon 12.19.2012 v12.3 pracview Email

dw_detail.settransobject( sqlca)
dw_detail.retrieve( )


if isNull(dw_detail.getItemNumber(1,"email_to")) then
		dw_detail.setitem( 1,"email_to",1)
end if
end event

type dw_detail from datawindow within w_wv_email_setting
integer x = 46
integer y = 160
integer width = 2405
integer height = 764
integer taborder = 30
string title = "none"
string dataobject = "d_wv_email_setting"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//added by long.zhang appeon 12.19.2012 v12.3 pracview Email
long ll_null

if dwo.name = "email_to" then
	
		if data <> "3" then
			setNull(ll_null)
			this.setitem( row,"role_id",ll_null)
		end if
		
end if
end event

type cb_close from commandbutton within w_wv_email_setting
integer x = 2098
integer y = 36
integer width = 343
integer height = 92
integer taborder = 20
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

type cb_save from commandbutton within w_wv_email_setting
integer x = 1728
integer y = 36
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Save"
end type

event clicked;//added by long.zhang 12.19.2012 v12.3 pracview Email
dw_detail.accepttext( )

if dw_detail.modifiedcount( ) = 0 then return


if dw_detail.getitemnumber( 1,"email_to") = 3 then
	
			if isNull(dw_detail.getItemNumber(1,"role_id")) then
				MessageBox("Prompt","Required value missing for the Role Id, please select a value. ")
				return -1		
		end if
		
end if
dw_detail.update()
end event

