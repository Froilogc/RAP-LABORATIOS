@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_BOOKING_6582
  as select from ztb_booking_6582
  association        to parent Z_R_TRAVEL_6582 as _Travel     on $projection.TravelId = _Travel.TravelId
  composition [0..*] of Z_I_BOOKSUP_6582       as _Bookingsupl
  association [1..1] to /DMO/I_Customer        as _Customer   on $projection.CustomerId = _Customer.CustomerID
  association [1..*] to /DMO/I_Connection      as _Connection on $projection.ConnectionId = _Connection.ConnectionID
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price    as FlightPrice,
      currency_code,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Travel,
      _Bookingsupl,
      _Customer,
      _Connection

}
