# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app  
The gem Sinatra has been used to build the app.
- [X] Use ActiveRecord for storing information in a database
ActiveRecord database has been used to store the users and recipes.
- [X] Include more than one model class (e.g. User, Post, Category)
This application has 2 model classes: Users and Recipes.
- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
Users have many recipes.
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
A recipe belongs to one user.
- [X] Include user accounts with unique login attribute (username or email)
Users are authenticated with their username and password.
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
User can create new recipes, read all recipes and update or destroy recipes that belong to them.
- [X] Ensure that users can't modify content created by other users
A recipe that belongs to another user cannot be modified or deleted. We check this by comparing the currrent user (helper method) to the recipe.user.
- [X] Include user input validations
Recipes cannot instantiated unless they have a name, ingredients and instructions. Similarly, new users cannot be created unless the name, email and password fields are populated.
- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
Used rack-flash3 to include error messages to the user when editing or deleting content that did not belong to them. Also included required HTML form fields that pop up a message when a required field is not populated.
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Done.

Confirm
- [X] You have a large number of small Git commits
30 plus commits with comments describing the change.
- [X] Your commit messages are meaningful
Done.
- [X] You made the changes in a commit that relate to the commit message
Done.
- [X] You don't include changes in a commit that aren't related to the commit message
Done.
