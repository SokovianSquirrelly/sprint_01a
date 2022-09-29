import 'dart:io';

// Here is my class for Date.  This simply stores the month, year, and day of a
// vacation entry.

class Date
{
  String month = "January";
  int monthNumber = 1;
  int day = 1;
  int year = 1900;

//  Method: getMonthNumber()
//  Purpose: Prompts the user for a number between 1 and 12.

  int getMonthNumber()
  {
    bool invalid = true;
    while (invalid)
    {
      try
      {
        print('Enter a month number: ');
        monthNumber = int.parse(stdin.readLineSync()!);
        if (monthNumber >= 1 && monthNumber <= 12)
        {
          invalid = false;
        }
        else
        {
          print("That response isn't valid.");
        }
      }
      catch(e)
      {
        print("That response isn't valid.");
      }
    }
    return monthNumber;
  }

//  Method: getDay()
//  Purpose: Prompts the user for a day of the month and determines if the
//    response is valid depending on the month and year.  This even includes
//    solving for leap years in February.

  int getDay()
  {
    bool invalid = true;
    while (invalid)
    {
      try
      {
        print('Enter a day: ');
        day = int.parse(stdin.readLineSync()!);

        if (day <= 0 || day >= 31)
        {
          print("That's not a valid day.");
        }

        else if (day > 28 && month == 'February')
        {
          if (day == 29)
          {
            if (year % 4 != 0)
            {
              print("That's not a valid day.");
            }

            else if (year % 400 == 0)
            {
              invalid = false;
            }

            else if (year % 100 == 0)
            {
              print("That's not a valid day.");
            }

            else
            {
              invalid = false;
            }
          }

          else
          {
            print("That is not a valid day.");
          }
        }

        else if (day == 31)
        {
          if (month == 'April' || month == 'June' ||
              month == 'September' || month == 'November')
          {
            print("That's not a valid day.");
          }

          else
          {
            invalid = false;
          }
        }

        else
        {
          invalid = false;
        }
      }
      catch(e)
      {
        print("That response isn't valid.");
      }
    }
    return day;
  }

// Method: getYear()
// Purpose: Prompts the user for a year.  This is written to only accept dates
//  on or after 1900.

  int getYear()
  {
    bool invalid = true;

    while (invalid)
    {
      try
      {
        print('Enter a year: ');
        year = int.parse(stdin.readLineSync()!);
        if (year < 1900)
        {
          print("Could we actually get a year 1900 or later please?");
        }

        else
        {
          invalid = false;
        }
      }
      catch(e)
      {
        print("That response isn't valid.");
      }
    }

    return year;
  }

// setMonth()
// Assigns a month depending on the inputted monthNumber from before.

  void setMonth()
  {
    switch(monthNumber)
    {
      case 1:
      {
        month = "January";
        break;
      }

      case 2:
      {
        month = "February";
        break;
      }

      case 3:
      {
        month = "March";
        break;
      }

      case 4:
      {
        month = "April";
        break;
      }

      case 5:
      {
        month = "May";
        break;
      }

      case 6:
      {
        month = "June";
        break;
      }

      case 7:
      {
        month = "July";
        break;
      }

      case 8:
      {
        month = "August";
        break;
      }

      case 9:
      {
        month = "September";
        break;
      }

      case 10:
      {
        month = "October";
        break;
      }

      case 11:
      {
        month = "November";
        break;
      }

      case 12:
      {
        month = "December";
        break;
      }
    }
  }

// Method: displayDate()
// Purpose: Displays the given date.

  void displayDate()
  {
    stdout.write('$month $day, $year');
  }
}

// Here is my class for entry.  This takes two Date objects, being the start
// and end dates, as well as a location, event name, what kind of event led to
// vacation, and two lists: one for photographs taken on vacation and another
// one for buddies that went on vacation as well.

class Entry
{
  Date startDate = Date();
  Date endDate = Date();
  String location = "";
  String event = "";
  String name = "";
  var photographs = [];
  var taggedFriends = [];

// Method: getName()
// Purpose: Prompts for and returns an entry name.

  String getName()
  {
    print("What name would you like to give this trip entry?");
    name = stdin.readLineSync()!;
    return name;
  }

// Method: getStartDate()
// Purpose: Creates the start date from the Date class.

  Date getStartDate()
  {
    print("Let's get info on when you started your vacation.");
    startDate.getYear();
    startDate.getMonthNumber();
    startDate.setMonth();
    startDate.getDay();

    return startDate;
  }

// Method: getEndDate()
// Purpose: Gets the end date and determines if it actually comes later than
// the start date or not.  If this date is earlier than the start date, an
// error occurs and the user has to re-input the end date.

  Date getEndDate()
  {
    print("Now, let's get info on when your trip ended.");
    bool invalid = true;
    while(invalid)
    {
      endDate.getYear();
      endDate.getMonthNumber();
      endDate.setMonth();
      endDate.getDay();

      if (endDate.year < startDate.year)
      {
        print("Your end date can't be before your start date.");
      }

      else if (endDate.year == startDate.year)
      {
        if (endDate.monthNumber < startDate.monthNumber)
        {
          print("Your end date can't be before your start date.");
        }

        else if (endDate.monthNumber == startDate.monthNumber)
        {
          if (endDate.day < startDate.day)
          {
            print("Your end date can't be before your start date.");
          }

          else
          {
            invalid = false;
          }
        }

        else
        {
          invalid = false;
        }
      }

      else
      {
        invalid = false;
      }
    }

    return endDate;
  }

// Method: getLocation()
// Purpose: Prompts for the location of the vacation.

  String getLocation()
  {
    print('Where did you go on your trip?');
    location = stdin.readLineSync()!;
    return location;
  }

// Method: getEvent()
// Purpose: Prompts for the user to explain why they took a vacation. It could
//    be for a business trip, bachelor party, family reunion, or a honeymoon.
//    Tell you the truth, my honeymoon in Mexico was a big source of
//    inspiration for my idea.

  String getEvent()
  {
    stdout.write('What was the special occasion for your trip? (ex. ');
    print("Honeymoon, Spring Break, etc)");
    event = stdin.readLineSync()!;
    return event;
  }

// Method: getPictures()
// Purpose: Prompts for the filenames of pictures that were taken during a
//    vacation and stores them in a list to be displayed later.  I'd love if I
//    could actually display the pictures but I'm not quite there yet, so the
//    program will just display the filenames instead.

  void getPictures()
  {
    bool morePictures = true;
    while (morePictures)
    {
      print("Please type the filename of a photo you took on your vacation.");
      photographs.add(stdin.readLineSync()!);
      print ("");

      bool invalid = true;
      while (invalid)
      {
        print("Would you like to add more photos? (y/n)");
        String? response = stdin.readLineSync()!;

        if (response == "y")
        {
          invalid = false;
          print("");
        }
        else if (response == "n")
        {
          invalid = false;
          morePictures = false;
        }
        else
        {
          print("That's not a valid response.");
        }
      }
    }
  }

// Method: getBuddies()
// Purpose: Asks the user if there were any friends they'd like to tag with
//    their vacation entry.  My thought for this was for friends to get tagged
//    on social media and they could add their own photos and such, but given
//    how comparatively primitive this program is right now, we're not there
//    yet.

  void getBuddies()
  {
    bool invalid = true;
    while (invalid)
    {
      print("Did you have any friends on vacation with you? (y/n)");
      String? response = stdin.readLineSync()!;
      print("");
      if (response == "y")
      {
        invalid = false;
        bool moreFriends = true;

        while (moreFriends)
        {
          print("Who would you like to tag?");
          taggedFriends.add(stdin.readLineSync()!);
          print("");
          bool reInvalid = true;

          while (reInvalid)
          {
            print("Is there anyone else you'd like to add? (y/n)");
            String? cont= stdin.readLineSync()!;

            if (cont == "y")
            {
              reInvalid = false;
            }

            else if (cont == "n")
            {
              reInvalid = false;
              moreFriends = false;
            }

            else
            {
              print("That response isn't valid.");
              print("");
            }
          }
        }

      }
      else if (response == "n")
      {
        invalid = false;
      }
      else
      {
        print("That response isn't valid.");
        print("");
      }
    }
  }

// Method: displayDetails()
// Purpose: Displays the entry's details, including a list of photo filenames
//    and friends/family that had travelled with the user.  If the user chose
//    not to include any friends, the "Friends" list will just be empty.

  void displayDetails()
  {
    print(name);
    print('-----------------------------------------------');
    startDate.displayDate();
    stdout.write(' to ');
    endDate.displayDate();
    print("");
    print('Location: $location');
    print('Special Occasion: $event');
    print('Photos:');
    photographs.forEach((photo) => {print("     > $photo")});
    if (taggedFriends.isNotEmpty)
    {
      print('Friends:');
      taggedFriends.forEach((buddy) => {print("     > $buddy")});
    }
  }
}

// And here's main()

void main()
{
  Entry entry = Entry();

  entry.getName();
  print("");
  entry.getStartDate();
  print("");
  entry.getEndDate();
  print("");
  entry.getLocation();
  print("");
  entry.getEvent();
  print("");
  entry.getPictures();
  print("");
  entry.getBuddies();

  print("");
  print("");
  print("");

  entry.displayDetails();
  print("");
}