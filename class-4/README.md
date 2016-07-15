#Week 6 - Class 4
##Homework
* Build the UI:
	* Embed the ViewController into the NavigationController.
	* Create a new viewController called AddViewController. Define class method identifier:.
		* Add Student property to the AddViewController.
		* Setup AddViewController scene with text fields for each model variable. Add "Save" button.
	* Add UIBarButton to the ViewController & create a segue to the AddViewController.
	* Add a table view to the ViewController.
* Build the Backup Engine.
	* Create / add a function `studentsFromRecords:completion:` to Student+Addition
	* Create CouldBackupService.
	* Run tests in viewDidLoad: to set for all possible options such as creation, deletion of Student records.
	* Implement creation / deletion of student records into the UI.
	* Update StudentStore to include completions in add:, remove:, removeItIndexPath: methods.

###Reading Assignment:
* Programming in Objective-C:
  * **Chapter 9:** Polymorphism, Dynamic Typing and Dynamic Binding

##Other Resources
* [Reading Assignments](../../Resources/ra-grading-standard/)
* [Grading Rubrics](../../Resources/)
* [Lecture Resources](lecture/)
* [Lecture Slides](https://www.icloud.com/keynote/0001fv5Yc5QYUMGr2wWLbIFUQ#Week6_Day4)
