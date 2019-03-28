Ce projet a été réalisé comme test technique pour AB Tasty

GOAL

```
You'll cover some basics about API design. As such, you'll focus only on the backend of the application. Others will build apps later, using your API as backbone.

The following user stories describe what should be possible to do through this API:

A consultant can sign up (only with an "@abtasty.com" e-mail address though)
A consultant can view all the clients of AB Tasty
A consultant can add a client to his portfolio
A consultant can remove a client from his portfolio
A consultant can register time, for a specific client
A consultant can update a time entry he did in the past
A consultant can delete a time entry he owns
A consultant can view all the tasks he performed this calendar week
```

Le lien vers l'application est https://pb-time-tracking.herokuapp.com

Le site est développé en Ruby : 2.4.5 et en Rails 5.2.2.1

Les gem utilisées sont :
* gem 'devise'
* gem 'simple_form'
* gem 'pundit'

Pour lancer l'application sur votre ordinateur:

```
git clone git@github.com:Ceriiise/time_tracking_AB.git
cd time_tracking_AB
bundle install
yarn install
rails db:create
rails db:migrate
rails db:seed
rails s
```

Pour vous connecter:

* login : philippine@abtasty.com
* mdp : 123456
