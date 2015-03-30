### Purpose
The following challenge is designed for your to show the cummulaive skillsets you've developed durning your time in phase 2. The applications purpose, design, and implementation are open for your intereration. 

### Remember
1. It's not neccessary for you to fulfill all of the requirements. This is your chance to show us what you know. 
2. The requirements you do fulfill. Make them fully complete, tested, and clean. They should be the best representation of your work.
3. Be able to talk about the parts of the application that you've created. 
4. Be able to talk about the requirements that you did not fulfill in order to show applied knowledge to your code reviewer.
5. Use good git hygiene, create branches when necessary, and rebase off your master branch.  

## You have Core Hours to complete the following

### Release 0: Setting up the Challenge
1. In the **cohorts organization** create a new repository with your applications name. This should be an empty repository.

![alt 'new repo'](./references/new_repo.png)

3. Clone the solo-challenge repository on your local machine.
4. Use the following commands to move the skeleton into your repository:

```
$ mv solo-challenge/ your-app/
$ cd your-app
$ git remote remove origin
$ git remote add origin https://github.com/nyc-sea-lions-2015/your-app
$ git push origin master
```

That's it, you should be all setup to begin development.

### Release 1: The Challenge
Create a basic CRUD application, using Sinatra. Then enhance your application using JavaScript to satisfy the following requirements.

* 3 or More Models / resources
  * This includes the Users Model
* Relate these models together using ActiveRecord
* Implement User Authentication
* Generate Tests for custom model logic that you see fit.
* Generate Tests for controller logic and flow that you see fit.
* Implement an AJAX Get request
* Implement an AJAX Update request

