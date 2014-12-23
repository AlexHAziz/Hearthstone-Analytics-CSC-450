Getting Started (User)
  1. Make sure you have [Ruby](https://www.ruby-lang.org/en/) installed on your machine.
  2. Open terminal or cmd and navigate to the project (ie. using cd path/to/project or dir path/to/project)
  3. Generate Data
    - For mock data
        3.1. navigate into the analytics/lib/ directory
        3.2. Run "ruby create_data_dump.rb" 
        3.3. Secify the number of the games you want to mock.
    - For simulated data
        3.1. navigate into the simulation/lib/ directory
        3.2. Run "ruby game.rb" 
        3.3. Secify the number of the games you want to mock.
  4. Run the Report
    4.1 Navigate into the analytics/lib/ directory
    4.2 Run "ruby report.rb" 
    4.3. Select the file with the data you want to use

Getting Started (Dev)
  1. Make sure you have [Ruby](https://www.ruby-lang.org/en/) installed on your machine.
  2. Install [bundler](http://bundler.io/) by runing 'gem install bundler', you may want to read about what this is and why its awesome.
  3. Install gems by running 'bundle install', this will install rspec which is our test suite.

Coding process (Please follow this procedure when adding features)
  - make a new branch for the feature i.e. git checkout -b my_new_feature 
  - write code
  - run and test code
  - stage files for commit i.e. git add -a
  - commit files i.e. git commit
  - Type a detailed commit message in the format (subject, blank line, body) 
  - Create a patch
    - git log -1 > my_patch.patch
    - git diff my_branch_name..master > my_patch.patch
  - Email me your patch file 
  - When I review it I will email you back a r=me
  - Once you receive the r=me merge the changes with master
    - git checkout master
    - git merge my_branch_name
  - Push the changes i.e.  git push
