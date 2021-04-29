# Ruby on Rails Team Week Project for Epicodus: Gunpla Collections and Reviews

#### By Jon Stump, David Couch, and Kerry Lang

* * *

## Description

This is a website for Gunpla fans to keep their collection and review their favorite Gunpla kits. If you would like to see a live version of the website on Heroku, you can find it [here.](https://cryptic-basin-12416.herokuapp.com/gunplas)

![Table Schema](/public/img/gunpla_schema.png)
* * *

## Technologies used

* Ruby
* Rspec
* Byebug
* Rails
* VSCode
* Postgres
* HTML
* SCSS
* Bundler
* git
* Faker
* Devise
* bootstrap
* C8H10N4O2

* * *

## Specs

Initial Specs:
| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
| Allows users to input a review for a Gunpla  | Review information including Title, Rating, and Body | Shows rating on individual Gunpla |
| Allows users to add Gunpla to a collection  | Click on add to collection button | Shows kit on user's collection |
| Allows users to remove Gunpla from a collection  | Click on remove from collection button | Removes kit from user's collection |

* * *

## Installation

* Go to ( https://github.com/jonstump/gunpla-collections ).

* Navigate to the code button on the github website.

* Click on the code button to open the menu.

- Copy the HTTPS code by clicking the clipboard next to the link.

- Within your Bash terminal navigate to your desired location by using cd fallowed by your desired directory.

```bash
 cd Desktop
```

- Once you have chosen your desired directory use the command.

```bash
git clone https://github.com/jonstump/gunpla-collections
```

<div
  style="
    background-color: #d1ecf1;
    color: grey; padding: 6px;
    font-size: 9px;
    border-radius: 5px;
    border: 1px solid #d4ecf1;
    margin-bottom: 12px"
>
  <span
    style="
      font-size: 12px;
      font-weight: 600;
      color: #0c5460;"
  >
    ⓘ
  </span>
  <span
    style="
      font-size: 12px;
      font-weight: 900;
      color: #0c5460;
      margin-bottom: 24px"
  >
    Note :
  </span>
  If you have any problems make sure your HTTPS code is correct! The example above might not be the most recent HTTPS code!
</div>

* Now that the project is downloaded you will need to run the command 'bundle install' to install all of the gems from the Gemfile.

``` bash
bundle install
```

* In oder to run the tests enter 'rspec' into your terminal.

``` bash
rspec
```

* If you would like to see the code use the command "editor ." (where editor is your code editor. example code for VScode and vim for Vim) to open the project in your code editor.

``` bash
nvim .
```

* You will need to use rails in order to setup the databases for the project along with Postgres installed on your machine as well. To install the databases and tables run the following command in your terminal:

``` bash
rake db:create
```
``` bash
rake db:migrate
```
``` bash
rake db:test:prepare
```
``` bash
rake db:seed
```

* To launch a local version of the site in your browser enter the following:

``` bash
rails s
```

This will launch a local host via Rails. You should be able to navigate to http://localhost:3000/ to see the site locally.

## To dos

* Deploy to Heroku

## Bugs

* None at this time

## Resources
* [Gunpla Wiki](https://gunpla.fandom.com/wiki/Gunplapedia)
* [Gundam Info](https://en.gundam.info/)
* [w3Schools](https://www.w3schools.com/)
* [stackoverflow](https://stackoverflow.com/)

* * *

## License

> All Rights Reserved
> Jon Stump, David Couch, Kerry Lang &copy; 2021
> Gundam is owned by Sotsu Sunrise
> Neon Gensis Evangelion is owned by Gainax

* * *

## Contact Information

_Jon Stump: [Email](jmstump@gmail.com)_
_David Couch: [Email](dcouch440@gmail.com)_
_Kerry Lang: [Email](klang812@gmail.com)_