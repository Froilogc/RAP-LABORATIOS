@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption- Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_C_BOOKING_6582
 as projection on Z_I_BOOKING_6582
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    currency_code as CurrencyCode,
    BookingStatus,
   @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    /* Associations */
    _Bookingsupl : redirected to composition child  Z_C_BOOKSUP_6582,
    _Connection,
    _Customer,
    _Travel : redirected to parent Z_C_TRAVEL_6582
}
