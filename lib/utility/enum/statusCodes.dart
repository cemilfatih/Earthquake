enum statusEnum{
  success,
  error,
  warning,
  info,
  none;

  int get statusCode{

    try{
      switch(this){
        case statusEnum.success:
          return 200;
        case statusEnum.error:
          return 400;
        case statusEnum.warning:
          return 300;
        case statusEnum.info:
          return 100;
        case statusEnum.none:
          return 0;
      }
    }catch(e){
      return 0;
    }
}
}