# Socket Chat

## Project description:
- This project is a clone of Slack application, based on RubyOnRails.
- The main purpose of this project are:
    - simple scientific researches to check practice ability of creation complicated project like Slack with RubyOnRails
    - improve skills of software developers, who will contribute this project
    - share progress and experience with other developers and learn from them
- This project can digress from Slack principles in some parts and don't guarantee to 100% equality

## Technical details

- ruby 2.4.1
- rails 5.1.5
- postresql
- webpacker
- react

## Start development instructions

- git clone (project)
- create .ruby-gemset file (gitignored) to denote gemset - inside type *gemset_name*
- create .ruby-version file (gitignored) to indicate the version of ruby - inside type 2.4.1
- ```cd``` in terminal to project directory (to create gemset)
- run ```gem install bundler```
- run ```bundle install```
- run ```rake db:create db:migrate```
- install yarn to your local machine (optional - if doesn't have)
- run ```yarn install``` to install necessary npm packages
- run webpacker to auto compile ```./bin/webpack-dev-server``` more details [Webpacker](https://github.com/rails/webpacker)
- run ```rails s``` 

### Local Network Run
- in **config/environments/development.rb**
    - replace ```config.action_cable.url = "ws://localhost:3000/cable"```
    - with ```config.action_cable.url = "ws://your_local_ip:3000/cable"```
- in **app/javascript/packs/actioncable_connect.js**
    - replace ```var cable = ActionCable.createConsumer('ws://localhost:3000/cable')```
    - with ```var cable = ActionCable.createConsumer('ws://your_local_ip:3000/cable')```
- in **config/webpacker.yml**
    - replace 
        ```
            dev_server:
                https: false
                host: localhost
                port: 3035
                public: localhost:3035
                hmr: false        
        ```
    - with
        ```
            dev_server:
                https: false
                host: your_local_ip
                port: 3035
                public: your_local_ip:3035
                hmr: false            
        ```

## Code-rules

- The **development** is carried out on the **development** branch. Create working branches from this branch
- The test coverage is MANDATORY and it should be at a level not lower than 85%
- Code must pass rubocop successfully.
- Branch name should be the same as Issue name
- Pull request should have link on Issue, which it resolve
- Each Issue, branch, pull request should have one name prefix from this list:
    - feature - when you create new model, controller, gem, other functional (if new functional only improves current code - it shouldn't be this prefix)
    - content - when you add or change static content on any pages 
    - fix - when you fix some bug, which is not urgent and not affected on production
    - hot-fix - when you fix urgent bug, which affected on production
    - enhancement - when you improve some existing code, functional etc.
    - refactor - when you make changes of existing code to improve speed, follow all conventions, make it more readable etc.
    - remove - when you remove some code or functional/gem from project

## Contributing and collaboration

- Contributors and collaborators must follow [Code Rules](#code-rules)

- Create new Issue in the current project (optional - you can work on issue, which was created before)
- Fork repository
- Create local branch to resolve project issue
- Make all necessary changes in your local branch. Keep this branch up to date with stable code to avoid conflicts
- Before push - check your code with rubocop
- After all changes push your branch to your forked remote repository
- Crete pull request to repository which you forked:
    - if you create pull request but you still work on it - pull request name must start with "WIP: "
    - pull request must:
        - have link to Issue, which it resolve
        - have short description of changes
        - be approved by collaborator
    - pull request can be merged only after approved
- Don't create pull request, which is not related to issue.
    
## License
[License](LICENSE)
    
## Authors:
- Igor Polyakov
- Anton Storchak
- Vlad Pupirov
   