class GetTypes{
  static String getActivityType(int type) {
    switch (type) {
      case 50:
        return 'Gross Motor';
      case 51:
        return 'Fine Motor';
      case 52:
        return 'Cognitive';
      case 53:
        return 'Language';
      case 54:
        return 'Sensory';
      case 55:
        return 'Socio-Emotional';
      default:
        return 'Unknown';
    }
  }

  static String getAgeRange(int range) {
    switch (range) {
      case 89:
        return 'Before Birth';
      case 90:
        return '0-3 months';
      case 91:
        return '3-6 months';
      case 92:
        return '6-9 months';
      case 93:
        return '9-12 months';
      default:
        return 'Unknown';
    }

  }
  static int getAgeRangeInt(String desc) {
    if (desc.contains('0-3')) {
      return 90;
    } else if (desc.contains('Before')) {
      return 89;
    }else if (desc.contains('3-6')) {
      return 91;
    } else if (desc.contains('6-9')) {
      return 92;
    } else if (desc.contains('9-12')) {
      return 93;
    } else {
      return -1;
    }
  }


  static int getSelectedRelation(String selectedRelation) {
    switch (selectedRelation) {
      case 'Mom':
        return 100;
      case 'Dad':
        return 101;
      case 'Nanny':
        return 102;
      case 'Other':
        return 103;
      default:
        return 104;
    }
  }
}

