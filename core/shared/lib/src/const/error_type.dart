enum ErrorType {
  //custom error
  iOException,

  //Network Error
  network,
  netServerMessage,
  netDefaultError,
  unknown,
  // UI Errors
  ui,
  uiEmptyEmail,
  uiInvalidEmail,
  uiEmptyPassword,
  uiEmptyLocationName,
  uiNoLocation,

  //DB ERROR
  database,
  databaseNotSupported,
  databaseError1,
  databaseUserNotFound,


  //Local Error
  locationError
}
