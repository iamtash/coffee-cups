Coffee Cups
===========


Introduction
------------
A place for coffee aficionados to track and/or rate different types of coffee they try as well as stay apprised of what’s good in a coffee-centric social forum.

Coffee Cups is a tiny Content Management System (CMS) that allows users to, upon creation of an account:
* Create, rate, track, edit, and delete cups of coffee they consume
* Publish new coffee beans and coffee roasters to the app's public library of Coffees and Roasters
* View what other users are sippin' on
* Receive recommendations for new coffees to try


Usage
------------
Clone the repository
```ruby
bundle install
rake db:migrate
rails s
```

For use of GitHub OAuth login, start up server with
```ruby
thin start --ssl -p 3001
```

Visit specified port in browser


Contributions
-------------
Bug reports and pull requests are welcome, with adherence to the [Code of Conduct](./CODE_OF_CONDUCT.md)
#### Contributor's Guide
1. Fork the repository

2. Clone the fork

3. Make a git branch
  * Switch to that branch
4. Install dependencies

5. Make some commits

6. Open a Pull Request
  * Choose branch you were working on

[Source](https://medium.com/@jenweber/your-first-open-source-contribution-a-step-by-step-technical-guide-d3aca55cc5a6)


License
-------
The project uses the MIT [License](./LICENSE)

Blog & Video
---------

[Read about what I learned while building this project!](https://iamtash.github.io/rails_project_coffeecups_2_0)

Click below to check out a demo!<br>
<a href="http://www.youtube.com/watch?feature=player_embedded&v=JxIBt6I_IyY
" target="_blank"><img src="http://img.youtube.com/vi/JxIBt6I_IyY/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>
