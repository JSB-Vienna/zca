"! <p class="shorttext synchronized" lang="en">Common object: Wrapped funcs for easier use</p>
CLASS zcl_ca_utils DEFINITION PUBLIC
                              FINAL
                              CREATE PUBLIC.

* P U B L I C   S E C T I O N
  PUBLIC SECTION.
*   i n t e r f a c e s
    INTERFACES:
      if_xo_const_message,
      zif_ca_c_bool,
      zif_ca_c_commit.

*   a l i a s e s
    ALIASES:
*     Message types
      c_msgty_e            FOR  if_xo_const_message~error,
      c_msgty_i            FOR  if_xo_const_message~info,
      c_msgty_s            FOR  if_xo_const_message~success,
      c_msgty_w            FOR  if_xo_const_message~warning,
*     Commit modes
      c_commit_mode_asynch FOR zif_ca_c_commit~c_commit_mode_asynch,
      c_commit_mode_by_caller FOR zif_ca_c_commit~c_commit_mode_by_caller,
      c_commit_mode_synch  FOR zif_ca_c_commit~c_commit_mode_synch,
*     Boolean flags
      c_false              FOR zif_ca_c_bool~c_false,
      c_true               FOR zif_ca_c_bool~c_true.

*   c o n s t a n t s
    CONSTANTS:
      "! <p class="shorttext synchronized" lang="en">Answer to popup: Yes</p>
      c_answer_yes    TYPE char1             VALUE '1'  ##no_text,
      "! <p class="shorttext synchronized" lang="en">Answer to popup: No</p>
      c_answer_no     TYPE char1             VALUE '2'  ##no_text,
      "! <p class="shorttext synchronized" lang="en">Answer to popup: Cancel</p>
      c_answer_cancel TYPE char1             VALUE 'A'  ##no_text.

*   s t a t i c   m e t h o d s
    CLASS-METHODS:
      "! <p class="shorttext synchronized" lang="en">Execute COMMIT WORK</p>
      "!
      "! @parameter iv_commit_mode | <p class="shorttext synchronized" lang="en">Type of commit (0=by caller; 1=asynch; 2=synch/wait)</p>
      "! @parameter iv_for_bapi    | <p class="shorttext synchronized" lang="en">1 = Use BAPI function module (includes buffer refresh)</p>
      "! @raising   zcx_ca_param   | <p class="shorttext synchronized" lang="en">Common exception: Parameter error (INHERIT from this excep!)</p>
      do_commit
        IMPORTING
          iv_commit_mode TYPE zca_d_commit_mode DEFAULT c_commit_mode_asynch
          iv_for_bapi    TYPE dml_boolean DEFAULT c_false
            PREFERRED PARAMETER iv_commit_mode
        RAISING
          zcx_ca_param,

      "! <p class="shorttext synchronized" lang="en">Create icon (by corresponding FM)</p>
      "!
      "! @parameter iv_icon      | <p class="shorttext synchronized" lang="en">Icon name</p>
      "! @parameter iv_text      | <p class="shorttext synchronized" lang="en">Text (behind icon)</p>
      "! @parameter iv_quickinfo | <p class="shorttext synchronized" lang="en">Quickinfo</p>
      "! @parameter iv_add_qinfo | <p class="shorttext synchronized" lang="en">1 = Attach standard quickinfo; 0 = Suppress any quickinfo</p>
      "! @parameter rv_icon      | <p class="shorttext synchronized" lang="en">Carrier field for icons</p>
      icon_create
        IMPORTING
          iv_icon        TYPE csequence
          iv_text        TYPE csequence OPTIONAL
          iv_quickinfo   TYPE csequence OPTIONAL
          iv_add_qinfo   TYPE dml_boolean DEFAULT c_true
        RETURNING
          VALUE(rv_icon) TYPE icon_text
        RAISING
          zcx_ca_param,

      "! <p class="shorttext synchronized" lang="en">Standard popup to confirm loss of data</p>
      "!
      "! @parameter iv_use_cancel | <p class="shorttext synchronized" lang="en">1 = Display cancel button</p>
      "! @parameter rv_answer     | <p class="shorttext synchronized" lang="en">1 = Yes, save; 2 = No, ignore changs; A = Cancel action</p>
      popup_to_confirm_loss_of_data
        IMPORTING
          iv_use_cancel    TYPE dml_boolean DEFAULT c_true
        RETURNING
          VALUE(rv_answer) TYPE char1,

      "! <p class="shorttext synchronized" lang="en">Execute ROLLBACK WORK</p>
      "!
      "! @parameter iv_for_bapi | <p class="shorttext synchronized" lang="en">1 = Use BAPI function module (includes buffer refresh)</p>
      rollback
        IMPORTING
          iv_for_bapi TYPE dml_boolean DEFAULT c_false.
ENDCLASS.



CLASS zcl_ca_utils IMPLEMENTATION.

  METHOD do_commit.
    "-----------------------------------------------------------------*
    "   Execute COMMIT WORK
    "-----------------------------------------------------------------*
    "Local data definitions
    DATA:
      ls_return            TYPE bapiret2.

    "Check values
    IF iv_commit_mode CN '012'.
      "Parameter '&1' has invalid value '&2'
      RAISE EXCEPTION TYPE zcx_ca_param
        EXPORTING
          textid   = zcx_ca_param=>param_invalid
          mv_msgty = c_msgty_e
          mv_msgv1 = 'IV_DO_COMMIT' ##no_text
          mv_msgv2 = CONV #( iv_commit_mode ).
    ENDIF.

    IF iv_commit_mode EQ c_commit_mode_by_caller.
      "Do nothing - may it's done by the caller
      RETURN.
    ENDIF.

    CASE iv_for_bapi.
      WHEN c_false.
        CASE iv_commit_mode.
          WHEN c_commit_mode_asynch.
            COMMIT WORK.

          WHEN c_commit_mode_synch.
            COMMIT WORK AND WAIT.
        ENDCASE.

      WHEN c_true.
        CASE iv_commit_mode.
          WHEN c_commit_mode_asynch.
            CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.

          WHEN c_commit_mode_synch.
            CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
              EXPORTING
                wait   = abap_true
              IMPORTING
                return = ls_return.

            DATA(lx_error) =
                  CAST zcx_ca_param(
                           zcx_ca_error=>create_exception(
                                     iv_excp_cls = zcx_ca_param=>c_zcx_ca_param
                                     iv_function = 'BAPI_TRANSACTION_COMMIT'
                                     is_return   = ls_return ) )  ##no_text.
            IF lx_error IS BOUND.
              RAISE EXCEPTION lx_error.
            ENDIF.
        ENDCASE.

      WHEN OTHERS.
        "Parameter '&1' has invalid value '&2'
        RAISE EXCEPTION TYPE zcx_ca_param
          EXPORTING
            textid   = zcx_ca_param=>param_invalid
            mv_msgty = c_msgty_e
            mv_msgv1 = 'IV_FOR_BAPI' ##no_text
            mv_msgv2 = CONV #( iv_for_bapi ).
    ENDCASE.
  ENDMETHOD.                    "do_commit


  METHOD icon_create.
    "-----------------------------------------------------------------*
    "   Create icon (by corresponding FM)
    "-----------------------------------------------------------------*
    "Convert boolean into flag
    DATA(lv_add_qinfo) = xsdbool( iv_add_qinfo EQ c_true ).

    "Create icon with requested components
    CALL FUNCTION 'ICON_CREATE'
      EXPORTING
        name                  = iv_icon
        text                  = iv_text
        info                  = iv_quickinfo
        add_stdinf            = CONV icon_int( lv_add_qinfo )
      IMPORTING
        result                = rv_icon
      EXCEPTIONS
        icon_not_found        = 1
        outputfield_too_short = 2   "Should not happen because of returnfield length
        OTHERS                = 3.
    IF sy-subrc NE 0.
      DATA(lx_error) =
            CAST zcx_ca_param(
                     zcx_ca_error=>create_exception(
                               iv_excp_cls = zcx_ca_param=>c_zcx_ca_param
                               iv_function = 'ICON_CREATE'
                               iv_subrc    = sy-subrc ) )  ##no_text.
      IF lx_error IS BOUND.
        RAISE EXCEPTION lx_error.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "icon_create


  METHOD popup_to_confirm_loss_of_data.
    "-----------------------------------------------------------------*
    "   Standard popup to confirm loss of data
    "-----------------------------------------------------------------*
    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = TEXT-pu1      "There are unsaved changes!
        text_question         = TEXT-pu2      "Do you like to save these changes?
        icon_button_1         = 'ICON_SYSTEM_SAVE'
        icon_button_2         = 'ICON_DELETE'
        default_button        = '1'
        display_cancel_button = xsdbool( iv_use_cancel EQ c_true )
        start_column          = 25
        start_row             = 6
      IMPORTING
        answer                = rv_answer ##no_text.
  ENDMETHOD.


  METHOD rollback.
    "-----------------------------------------------------------------*
    "   Execute COMMIT WORK
    "-----------------------------------------------------------------*
    CASE iv_for_bapi.
      WHEN c_false.
        ROLLBACK WORK.

      WHEN c_true.
        "Parameter RETURN will always be empty - so no error handling necessary
        CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
    ENDCASE.
  ENDMETHOD.                    "do_commit
ENDCLASS.
