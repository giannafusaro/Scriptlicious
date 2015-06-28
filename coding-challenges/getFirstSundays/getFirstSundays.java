import java.util.ArrayList;

// author: Gianna Fusaro
// Quick and dirty esponse to a question on ProjectEuler.com

// 1 Jan 1900 was a Monday.
// Thirty days has September,
// April, June and November.
// All the rest have thirty-one,
// Saving February alone,
// Which has twenty-eight, rain or shine.
// And on leap years, twenty-nine.
// A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
// How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


public class getFirstSundays {

  public static void main(String args[]) {
    System.out.println("#########################################################################################");
    System.out.printf("FIRST-OF-MONTH SUNDAYS FROM: January 1, 1900 TO December 31, 2000\n");
    System.out.println("#########################################################################################");

    Date initialized = new Date(1, 0, 1900);
    Date date1 = new Date(1, 0, 1901);
    Date date2 = new Date(31, 11, 2000);

    initialized.getSundays(date1, date2);
  }
}
class Date {
  int initialYear=1900;
  int dayOfMonth;
  int year;
  int month;
  static int firstDayMonth = 1;
  int count=0;

  String[] daysName = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
  int[] monthsOfYear = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

  Date(int dayOfMonth, int month, int year) {
    this.dayOfMonth = dayOfMonth;
    this.month = month;
    this.year = year;
  }

  int getYear() {
    return this.year;
  }

  void setYear(int year) {
    this.year = year;
  }

  String getMonth() {
    return this.monthsToString(month);
  }
  void setMonth(int month) {
    this.month = month;
  }

  int getDayOfMonth() {
    return this.dayOfMonth;
  }

  public void getSundays(Date date1, Date date2) {
    getFirstSundays(this);
    while(date1.year <= date2.year) {
      monthsOfYear[1] = date1.isLeap() ? 29 : 28;
      getFirstSundays(date1);
      date1.setYear(date1.year+1);
    }
    System.out.printf("Count: %d \n", count);
    return;
  }

  public String getFirstSundays(Date date) {
    if(firstDayMonth == 0 && date.getYear()>initialYear) {
      System.out.printf("%s, %s %d, %d\n", date.getDay(firstDayMonth), date.getMonth(), date.getDayOfMonth(), date.getYear());
      count++;
    }
    firstDayMonth = ((monthsOfYear[date.month] + firstDayMonth) % 7);
    if( date.month == 11) {
      date.setMonth(0);
      return "##########################################################";
    }
    else {
      date.setMonth(date.month+1);
      return this.getFirstSundays(date);
    }
  }

  public boolean isLeap(){
    if(isCentury()) {
      return year % 400 == 0 ? true : false;
    }
    return year % 4 == 0 ? true : false;
  }
  public boolean isCentury() {
     return year % 100 == 0 ? true : false;
  }

  String monthsToString(int month) {
    switch(month) {
      case 0: return "JANUARY";
      case 1: return "FEBRUARY";
      case 2: return "MARCH";
      case 3: return "APRIL";
      case 4: return "MAY";
      case 5: return "JUNE";
      case 6: return "JULY";
      case 7: return "AUGUST";
      case 8: return "SEPTEMBER";
      case 9: return "OCTOBER";
      case 10: return "NOVEMBER";
      case 11: return "DECEMBER";
      default: return "Error somewhere, dude.";
    }
  }

  public String getDay(int oftheweek) {
    switch(oftheweek) {
      case 0: return "SUNDAY";
      case 1: return "MONDAY";
      case 2: return "TUESDAY";
      case 3: return "WEDNESDAY";
      case 4: return "THURSDAY";
      case 5: return "FRIDAY";
      case 6: return "SATURDAY";
      default: return "Error somewhere, dude.";
    }
  }
}
