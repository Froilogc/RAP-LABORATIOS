CLASS zcl_carga_flight_6582 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CARGA_FLIGHT_6582 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
      DATA:  LT_BOOKING TYPE TABLE OF ZTB_BOOKING_6582,
            LT_SUPP TYPE TABLE OF ZTB_BOOKSUP_6582,
             LT_TRAVEL TYPE TABLE OF  ZTB_TRAVEL_6582.


*Insert Travel
SELECT *
FROM /dmo/travel
INTO TABLE @DATA(LT_TV).

MOVE-CORRESPONDING  LT_TV[] TO LT_TRAVEL[].

DELETE FROM ztb_travel_6582.
INSERT ztb_travel_6582 FROM TABLE @LT_TRAVEL.
SELECT *
FROM ztb_travel_6582
INTO TABLE @lt_travel.
   out->write( sy-dbcnt ).
   out->write( 'ztb_travel_6582 data inserted successfully!' ).


*insert booking
SELECT *
FROM /dmo/booking
INTO TABLE @DATA(LT_BK).

MOVE-CORRESPONDING  LT_BK[] TO lt_booking[].

DELETE FROM ztb_booking_6582.
INSERT ztb_booking_6582 FROM TABLE @lt_booking.
SELECT *
FROM ztb_booking_6582
INTO TABLE @lt_booking.
   out->write( sy-dbcnt ).
   out->write( 'ztb_booking_6582 data inserted successfully!' ).


*insert supplement
SELECT *
FROM /dmo/book_suppl
INTO TABLE @DATA(LT_SP).

MOVE-CORRESPONDING  LT_SP[] TO lt_supp[].

DELETE FROM ztb_booksup_6582.
INSERT ztb_booksup_6582 FROM TABLE @lt_supp.
SELECT *
FROM ztb_booksup_6582
INTO TABLE @lt_supp.
   out->write( sy-dbcnt ).
   out->write( 'ztb_booksup_6582  data inserted successfully!' ).

  ENDMETHOD.
ENDCLASS.
