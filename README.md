Table of Contents
=================

  * [Leadfeeder Command Line Shortcuts](#leadfeeder-command-line-shortcuts)
    * [Basic Setup](#basic-setup)
    * [Opening Applications](#opening-applications)
    * [Web Searching](#web-searching)
    * [Quick Github Browser Navigation](#quick-github-browser-navigation)
    * [Adding Committing and Pushing](#adding-committing-and-pushing)
    * [Getting Code From Upstream](#getting-code-from-upstream)
    * [Branching](#branching)
    * [Quick Editing Recently Changed Files](#quick-editing-recently-changed-files)
    * [Additional Shortcuts](#additional-shortcuts)



Leadfeeder Command Line Shortcuts
=======



This app will give you handy commands to do awesome things like:

* Google search from your terminal
* Copy the name of your current git branch
* Checkout all Leadfeeder repos into a specified branch name (useful when one app in current branch depends on the changes of the other)
* Open current repo / issue in Github from your terminal
* .. and more



Basic Setup
---------------



##### Get The Code and Import It Into Your Bash Profile

---



* Download or clone this repo to your home (~/) directory

* Add the following code to your .bash_profile or wherever your bash settings are stored

  ```bash
  # sourcing all partial bash files
  for f in ~/.lf_bash_files/*.sh; do
     . $f
  done
  ```

  ​

#####Setting Up Your Preferred Applications and Your Leadfeeder Code Path

---



* Open your text editor to the file `.lf_bash_files/_setup.sh`


* Follow the instructions and fill in the following:
  * Your github user name
  * The Application Names of your Preffered:
    * Text Editor ("Sublime Text", "Atom", etc.)
    * Web Browser ("Google Chrome", "Firefox", etc.)
  * The absolute path to your Leadfeeder `/Code` directory



##### Restart Terminal Or Source Your Bash Profile Again

---

* Quit Terminal or enter following command

  `$ source ~/.bash_profile`

  ​

> Now you should be good to go!
>
> Test out some of the commands below.



## Opening Applications



#####Text Editor

---



######Open App

`$ edit`



######Open App With All Files in Current Directory

`$ edit .`



######Open App With Specific Filename/Directory

`$ edit <filename or directory>` 



##### Web Browser

---



###### Open App

`$ web`



######Open App To Specific Webpage

`$ web https://www.leadfeeder.com` 



##### Slack

---



######Open Slack App

`$ slack`



## Web Searching



##### Search the Web From One Command in your Terminal

---



###### Google Search

`$ google what is the weather in Helsinki?`

> To search google from the command line simply type the word `google` followed by a space and then then query you wish to search for



###### Stack Overflow Search

`$ stack how do I create a for each loop in ember`

> The same as with the google search but with the prefix `stack`



###### Wikipedia Search

`$ wiki vladimir putin`

> The same as with the google search but with the prefix `wiki`



## Quick Github Browser Navigation



#####Opens the Following Github Pages From Anywhere in your Terminal

---



###### Your Github Profile

`$ github`



###### Issues Assigned to You

`$ issues`



###### Your Active Pull Requests

`$ pulls`



###### Your Github Repos

`$ repos`



#####From Inside a Repo Directory Only

---



######Your Forked Version of Current Repo

`$ repo`



###### The Issue Your Current Branch Aims To Fix

`$ issue`

> Note: Branch name must begin with 4 digit issue number for this to work
>
> Example: `3037-add-visit-counter-to-filter`



## Adding Committing and Pushing



##### Step-By-Step

---



###### Add All Files in Current Repo

`$ add`

> $ git add -A



###### Commit Changes (with your commit message)

`$ commit <your commit message here>`

> $ git commit -m 



##### Add and Commit In One Step

---



###### Add All Files in Current Repo -AND- Commit

`$ admit <your commit message here>`

> $ git add -A && git commit -m 



##### Add, Commit, and Push In One Step

---



###### Add All Files -AND- Commit (with message) -AND- Push To Origin/Branch

`$ push_branch <your commit message here>`

> $ git add -A && git commit -m && git push



## Getting Code From Upstream



##### Fetching or Pulling

---



###### Fetch from Upstream

`$ fetch`

> $ git fetch leadfeeder



###### Pull from Upstream Master

`$ pull`

> $ git pull leadfeeder master



## Branching



#####Navigating / Editing Branches

---



###### Copy the Name of the Current Branch to Clipboard

`$ get_branch`

> Useful when you want to create same branch name in other repo or check back into this branch from another branch soon



###### Checkout A Specific Branch In All Repos Sharing that Branch Name

`$ checkout_all <your branch name here>`

> Highly useful when your current issue requires updates from multiple leadfeeder apps.
>
> Note: Only works when you have kept branch naming consistent across apps



###### Leave a Current Branch (checkout into master) and Delete It From Local

`$ delete_branch`



## Quick Editing Recently Changed Files



##### Open All Recently Changed Files In Text Editor

---



###### Any Files Modified Since Latest Commit

`$ open_modified`

> Only useful when status shows modified files



###### Any Files Different From Master

`$ open_changes`



###### Any Conflicting Files

`$ open_conflicts`

> Only useful during a rebase



## Additional Shortcuts



##### Rubocop Code Checking

---



###### Run Rubocop Code Checker Only on Ruby Files Changed Since Last Commit

`$ cop` 

> Be sure you have gems `rubocop` and `rubocop-rspec` installed



##### Rails Migration

---



###### Migrate Both Your DB and Your TestDB in One Command

`$ migrate`

> $ bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:migrate



##### History of Commands

---



###### List History of Your Previously Entered Commands

`$ h`

