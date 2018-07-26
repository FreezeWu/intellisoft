﻿$PBExportHeader$pfc_n_cst_dwcacheattrib.sru
$PBExportComments$PFC Caching attributes
forward
global type pfc_n_cst_dwcacheattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwcacheattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_id
n_ds		ds_obj
n_tr		tr_obj
any		a_args[]
string		s_method
string		s_filename
datawindow		dw_originalcontrol
datastore		ds_originalcontrol
powerobject		po_originaldata[]
string		s_originaldataobject
end variables

on pfc_n_cst_dwcacheattrib.create
call super::create
end on

on pfc_n_cst_dwcacheattrib.destroy
call super::destroy
end on

event destructor;call super::destructor;if isvalid(ds_obj) then Destroy ds_obj
end event

