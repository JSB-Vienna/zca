"! <p class="shorttext synchronized" lang="en">Common object: Constants for dynpro / dialog programming</p>
INTERFACE zif_ca_c_dynpro PUBLIC.
*   c o n s t a n t s
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">Fct. code: Collapse area (ICON_DATA_AREA_COLLAPSE)</p>
    c_fcode_area_collapse  TYPE syucomm VALUE 'AREA_COLLAPSE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Fct. code: Expand area (ICON_DATA_AREA_EXPAND)</p>
    c_fcode_area_expand    TYPE syucomm VALUE 'AREA_EXPAND' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Back</p>
    c_fcode_back           TYPE syucomm VALUE 'BACK' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Cancel (ICON_CANCEL)</p>
    c_fcode_cancel         TYPE syucomm VALUE 'CANCEL' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Change (ICON_CHANCE)</p>
    c_fcode_change         TYPE syucomm VALUE 'CHANGE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Check / proof (ICON_CHECK)</p>
    c_fcode_check          TYPE syucomm VALUE 'CHECK' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Complete (ICON_COMPLETE)</p>
    c_fcode_complete       TYPE syucomm VALUE 'COMPLETE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Copy ( ICON_COPY_OBJECT)</p>
    c_fcode_copy           TYPE syucomm VALUE 'COPY' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Create (ICON_CREATE)</p>
    c_fcode_create         TYPE syucomm VALUE 'CREATE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Delete (ICON_DELETE)</p>
    c_fcode_delete         TYPE syucomm VALUE 'DELETE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Pickup / show detail (ICON_SELECT_DETAIL)</p>
    c_fcode_detail         TYPE syucomm VALUE 'DETAIL' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Display (ICON_DISPLAY)</p>
    c_fcode_display        TYPE syucomm VALUE 'DISPLAY' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Continue / enter (ICON_OKAY)</p>
    c_fcode_enter          TYPE syucomm VALUE 'ENTER' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Exit</p>
    c_fcode_exit           TYPE syucomm VALUE 'EXIT' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: First object (ICON_TOTAL_LEFT)</p>
    c_fcode_obj_first      TYPE syucomm VALUE 'FIRST_OBJ' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Last object (ICON_TOTAL_RIGHT)</p>
    c_fcode_obj_last       TYPE syucomm VALUE 'LAST_OBJ' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Next object (ICON_COLUMN_RIGHT)</p>
    c_fcode_obj_next       TYPE syucomm VALUE 'NEXT_OBJ' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Previous object (ICON_COLUMN_LEFT)</p>
    c_fcode_obj_prev       TYPE syucomm VALUE 'PREV_OBJ' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: First page (ICON_FIRST_PAGE)</p>
    c_fcode_page_first     TYPE syucomm VALUE 'FIRST_PAGE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Last page (ICON_LAST_PAGE)</p>
    c_fcode_page_last      TYPE syucomm VALUE 'LAST_PAGE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Next page (ICON_NEXT_PAGE)</p>
    c_fcode_page_next      TYPE syucomm VALUE 'NEXT_PAGE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Previous page (ICON_PREVIOUS_PAGE)</p>
    c_fcode_page_prev      TYPE syucomm VALUE 'PREV_PAGE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Print (ICON_PRINT)</p>
    c_fcode_print          TYPE syucomm VALUE 'PRINT' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Refresh view (ICON_REFRESH)</p>
    c_fcode_refresh        TYPE syucomm VALUE 'REFRESH' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Add row (ICON_CREATE)</p>
    c_fcode_row_add        TYPE syucomm VALUE 'ADD_ROW' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Delete row (ICON_DELETE_ROW)</p>
    c_fcode_row_del        TYPE syucomm VALUE 'DEL_ROW' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Insert row (ICON_INSERT_ROW)</p>
    c_fcode_row_ins        TYPE syucomm VALUE 'INS_ROW' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Save / change data (ICON_SYSTEM_SAVE)</p>
    c_fcode_save           TYPE syucomm VALUE 'SAVE' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Search / find (ICON_SEARCH)</p>
    c_fcode_search         TYPE syucomm VALUE 'SEARCH' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Search / find next (ICON_SEARCH_NEXT)</p>
    c_fcode_search_next    TYPE syucomm VALUE 'SEARCH_NEXT' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Personnel settings (ICON_PERSONAL_SETTINGS)</p>
    c_fcode_settings       TYPE syucomm VALUE 'SETTINGS' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Switch mode / function (ICON_TOGGLE_FUNCTION)</p>
    c_fcode_toggle_func    TYPE syucomm VALUE 'TOGGLE_FUNC' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Switch between views (ICON_TOGGLE_DISPLAY)</p>
    c_fcode_toggle_disp    TYPE syucomm VALUE 'TOGGLE_DISP' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Function code: Switch between disp+chng mode (ICON_TOGGLE_*)</p>
    c_fcode_toggle_disp_chg TYPE syucomm VALUE 'TOGGLE_DISP_CHG' ##NO_TEXT,
    "! <p class="shorttext synchronized" lang="en">Screen attribute: Off</p>
    c_screen_off           TYPE num1 VALUE '0' ##no_text,
    "! <p class="shorttext synchronized" lang="en">Screen attribute: On</p>
    c_screen_on            TYPE num1 VALUE '1' ##no_text.
ENDINTERFACE.                "zif_ca_c_dynpro  DEFINITION
