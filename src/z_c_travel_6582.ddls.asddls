@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption- Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z_C_TRAVEL_6582
  provider contract transactional_interface as projection on Z_R_TRAVEL_6582
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
     @Semantics.user.createdBy: true
    CreatedBy,
     @Semantics.systemDateTime.createdAt: true
    CreatedAt,
    @Semantics.user.lastChangedBy: true
    LastChangedBy,
     @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child Z_C_BOOKING_6582,
    _Currency,
    _Customer
}
