@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_BOOKSUP_6582
  as select from ztb_booksup_6582

  association        to parent Z_I_BOOKING_6582 as _Booking       on  $projection.TravelId  = _Booking.TravelId
                                                                  and $projection.BookingId = _Booking.BookingId
  association [1..1] to /DMO/I_Supplement       as _supplement    on  $projection.SupplementId = _supplement.SupplementID
  association [1..1] to I_Currency              as _Currency      on  $projection.CurrencyCode = _Currency.Currency
  association [1..*] to /dmo/suppl_text         as _Suplementtext on  $projection.SupplementId = _Suplementtext.supplement_id

{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Booking,
      _supplement,
      _Currency,
      _Suplementtext
}
