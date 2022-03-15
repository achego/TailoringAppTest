String formatDate(DateTime passedDate) {
  String date = '';

  int year = passedDate.year;
  String month = passedDate.month.toString();
  int day = passedDate.day;

  switch (month) {
    case '1':
      month = 'Jan';
      break;
    case '2':
      month = 'Feb';
      break;
    case '3':
      month = 'Mrch';
      break;
    case '4':
      month = 'Aprl';
      break;
    case '5':
      month = 'May';
      break;
    case '6':
      month = 'June';
      break;
    case '7':
      month = 'Jly';
      break;
    case '8':
      month = 'Aug';
      break;
    case '9':
      month = 'Sept';
      break;
    case '10':
      month = 'Oct';
      break;
    case '11':
      month = 'Nov';
      break;
    case '12':
      month = 'Dec';
      break;
    default:
  }

  date = '$day-$month-$year';

  return date;
}
