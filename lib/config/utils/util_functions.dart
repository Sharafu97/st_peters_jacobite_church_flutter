String getBloodGroup(String bloodGroupId) {
  switch (bloodGroupId) {
    case '1':
      return 'A +ve';
    case '2':
      return 'A -ve';
    case '3':
      return 'B +ve';
    case '4':
      return 'B -ve';
    case '5':
      return 'O +ve';
    case '6':
      return 'O -ve';
    case '7':
      return 'AB +ve';
    case '8':
      return 'AB -ve';
    default:
      return '';
  }
}
