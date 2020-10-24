# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app 
- [x] Use ActiveRecord for storing information in a database - I did this by using the .new method as well as following that with .save. This was done both for my User model as well as my Racecar model. 
- [x] Include more than one model class (e.g. User, Post, Category) - I included both a User model and a Racecar model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - In the User model, a user has_many racecars.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -  In the Racecar model, a racecar belongs_to a user. 
- [x] Include user accounts with unique login attribute (username or email) - In the User model, the following is used: validates :username, uniqueness: true. This validates that a user has a username and that it is unique to other users. 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - A user is able to create a new racecar, and see that racecar on both the views/racecars/show page, as well as all of their racecars on the views/users/show page. 
- [x] Ensure that users can't modify content created by other users - If a user attempts to modify or delete another user's racecar, they are redirected to their users/show page where a flash message is displayed saying they cannot modify anything that is not theirs. 
- [x] Include user input validations - validates_the_presence_of is used to ensure that a user has all of the attributes that are in the schema of the users table. It is also used to ensure that a racecars has the same. 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Flash messages are used when a user tries to edit or delete a racecar that is not theirs, as well as when they try to access a page while not being logged in.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - All of these things are included in my README.md file. 

Confirm
- [x] You have a large number of small Git commits - I committed when appropriate
- [x] Your commit messages are meaningful - I attached a commit message for whatever I edited before I pushed to github
- [x] You made the changes in a commit that relate to the commit message - the message of my commit directly relates to what I edited in the file.
- [x] You don't include changes in a commit that aren't related to the commit message - I ensured that almost all of my commits were related to the commit message.
