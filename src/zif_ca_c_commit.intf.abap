"! <p class="shorttext synchronized" lang="en">Common object: Constants for commit work</p>
INTERFACE zif_ca_c_commit PUBLIC.
*   c o n s t a n t s
  CONSTANTS:
    "! <p class="shorttext synchronized" lang="en">By caller / no COMMIT WORK</p>
    c_commit_mode_by_caller TYPE zca_d_commit_mode VALUE '0' ##no_text,
    "! <p class="shorttext synchronized" lang="en">COMMIT WORK (asynchronous)</p>
    c_commit_mode_asynch    TYPE zca_d_commit_mode VALUE '1' ##no_text,
    "! <p class="shorttext synchronized" lang="en">COMMIT WORK AND WAIT (synchronous)</p>
    c_commit_mode_synch     TYPE zca_d_commit_mode VALUE '2' ##no_text.
ENDINTERFACE.
