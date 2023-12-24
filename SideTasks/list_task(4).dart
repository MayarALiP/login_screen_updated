// ignore_for_file: avoid_print
import 'dart:io';

void main() {
  List<int> myList = [];
  int length;

  print("How many elements in your list :- ");
  length = int.parse(stdin.readLineSync()!);

  print("Enter your list elements :- ");
  for (int i = 0; i < length; i++) {
    myList.add(int.parse(stdin.readLineSync()!));
  }

  print(myList);
//______________________________ Yor Try section _______________________________
  //TODO : try each function separately
  // extractLessThanValue(myList,5);
  // commonElement(myList);
  // evenList(myList);
  // onlyFirstAndLast(myList) ;
}

/*
  write a program that prints out
  all the elements of the list that are less than a certain value --> 5.
*/
void extractLessThanValue(List tryList,int value) {
  List<int> subList = [];

  for (int i = 0; i < tryList.length; i++) {
    if (tryList[i] < value) {
      subList.add(tryList[i]);
    }
  }
  print("Your elements that are less than 5 are $subList");
}
//------------------------------------------------------------------------------

/*
  write a program that returns a list that contains only the elements
  that are common between two Lists (without duplicates).
  Make sure your program works on two lists of different sizes.
*/
void commonElement(List tryList ) {
  List commonList =[] , secondList =[] ;
  int length2;

  print("How many elements in your second list :- ");
  length2 = int.parse(stdin.readLineSync()!);

  print("Enter your second list elements :- ");
  for (int i = 0; i < length2; i++) {
    secondList.add(int.parse(stdin.readLineSync()!));
  }

  print(secondList);

  Set set1 = tryList.toSet();
  Set set2 = secondList.toSet();

  Set commonSet =set1.intersection(set2);

  commonList =commonSet.toList();

  print("your common elements are :- $commonList");


}
//------------------------------------------------------------------------------

/*
  Write a Dart code that takes this list and makes a new list that has
  only the even elements of this list in it.
*/
void evenList(List tryList){

  List<int> evenNum =[] ;

  for(int i=0 ; i< tryList.length ;i ++)
  {
    if (tryList[i] % 2 ==0)
    {
      evenNum.add(tryList[i]);
    }
  }

  print("Your Event elements are $evenNum");
}
//------------------------------------------------------------------------------

/*
  Write a Dart code that makes a new list of
  only the first and last elements of the given list
*/
void onlyFirstAndLast(List tryList) {

  List<int> firast = [] ;

  firast.add(tryList.first);
  firast.add(tryList.last);

  print("Your First and Last elements are $firast in order ");
}

//------------------------------------------------------------------------------