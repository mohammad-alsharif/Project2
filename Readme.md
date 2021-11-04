### To Do List 

Project Description :
Through the application that you created, you can enter it, write Lists on it, delete and edit it using easy and clear interfaces 

he project can be divided into two main parts :

First : Interface design and construction 
We have many interfaces in the application, which are arranged as follows :
  - Home Interface ‫:‬  that contains an expressive picture of the List ‫,‬ The Swift file associated with the interface is ‫“ViewController”‬

- Table View interface, which contains the table that will display the Lists entered by the user‫,‬ The Swift file associated with the interface is ‫“TableViewController”‬

- I put the two interfaces inside the tab bar so that the user can move between them 

- I created a interface to edit the Lists in the table that contains a text field through which the user can edit  the existing notes  ‫,‬ The Swift file associated with the interface is ‫“UbdateList”‬


Second : Writing codes in Swift files

The work in application programming can be divided as follows ‫:‬
‫-‬ At first, in the TableViewController file, I created a class called List, which contains an array of type Task, and each object of the class will be a List.

-In the AddList file, I defined the add button that takes the entered value from the user (the List), which is in the form of a text, and adds it to the list to be displayed later in Table View .

-Then in the main file I defined the custom cell that I created through "tableView.register" and its Identifier

- Then I defined the table and the number of its sections and rows, and I also defined the cell and made the text in the cell ("listLabel") take the value that the user entered and previously stored in the array 

To Here the Lists are displayed on the table , and now we see how the editing and deletion operations are done 

- Editing :
In the main code, I created a function called updateList that takes the value passed from the delegate "updateName" and adds it to the list after the modification and makes tableView.reloadData() for the table to display the modification

- Deleting : 

In the table I used ‫“‬UITableViewCell.EditingStyle.delete‫”‬ to delete the row selected by the user

### Upcomming Feature :
Chick List,
Sort the items,
Add Date Picker
