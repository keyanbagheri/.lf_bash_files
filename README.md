

# Command Line Shortcuts

![leadfeeder-mascot.jgq](leadfeeder-mascot.jpg)



Table of Contents
=================

  * [About Leadfeeder Command Line Shortcuts](#about-leadfeeder-command-line-shortcuts)
    * [Basic Setup](#basic-setup)
    * [Start All Work Apps](#start-all-work-apps)
    * [Opening Applications](#opening-applications)
    * [Quick Github Browser Navigation](#quick-github-browser-navigation)
    * [Branch and File Managers](#branches-manager)
    * [Quick Editing or Viewing Recently Changed Files](#quick-editing-or-viewing-recently-changed-files)
    * [Rubocop Code Checking](#rubocop-code-checking)
    * [Web Searching](#web-searching)



About Leadfeeder Command Line Shortcuts
=======



This app will give you handy commands to do awesome things like:

* **Start/Stop** all your **work** apps with one command

* **Load Github pages** from your terminal with one command (current repo, current issue, all repos)

* **Quick edit** any files associated with your current branches

* **Checkout all** Leadfeeder **repos** into the same **branch name** (useful when one app in current branch depends on the changes of the other)

* **Search the web** from your terminal

* ... and more

  ​



Basic Setup
---------------



##### Get The Code and Import It Into Your Bash Profile

---



* Download or clone this repo to your home (**~/**) directory

* Add the following code to your **.bash_profile** or wherever your bash settings are stored

  ```bash
  # sourcing leadfeeder bash shorcuts
  . ~/.lf_bash_shortcuts/setup.sh
  ```

  ​

##### Setting Up Your Preferred Applications and Your Leadfeeder Code Path

---



1. Open your text editor to the file `.lf_bash_shortcuts/setup.sh`

2. Follow the instructions and fill in the following:

   1. Your **github username**
   2. The Application Names of your Preffered:
      1. **Text Editor** ("Sublime Text", "Atom", etc.)
      2. **Web Browser** ("Google Chrome", "Firefox", etc.)
   3. The absolute path to your Leadfeeder **/Code** directory

3. Restart Terminal or enter following command

   `$ source ~/.bash_profile`



> Then you should be good to go!
>
> Test out some of the commands below.



## Start All Work Apps



##### Starting Your Work Environment

------



###### Start Docker, launch DBs, Open Slack and CD into `/Code` 

`$ startwork`



###### Shutdown Docker, Tmux, Slack, your Text Editor and Terminal

`$ stopwork`



>If you wish to run additional apps on startup then you can add the commands in the file `work.sh`



## Opening Applications



##### Text Editor

------



###### Open Text Editor

`$ edit`



###### Open Text Editor With Specific Filename/Directory

`$ edit <filename or directory>` 



##### Web Browser

------



###### Open Browser

`$ web`



###### Open Browser To Specific Webpage

`$ web app.leadfeeder.com` 



##### Slack

------



###### Open Slack App

`$ slack`



##### Docker

------



###### Open Docker App

`$ dcapp`



## Quick Github Browser Navigation



##### Opens the Following Github Pages From Anywhere in your Terminal

---



###### Your Github Profile

`$ github`



###### Issues Assigned to You

`$ issues`



###### Issue by Specific Issue Number

`$ issue 2323`



###### Your Active Pull Requests

`$ requests`



###### Pull Requests by Specific Issue Number

`$ request 2323`



###### Your Github Repos

`$ repos`





##### From Inside a Repo Directory Only

---



###### Your Forked Version of Current Repo

`$ repo`



###### The Issue Your Current Branch Aims To Fix

`$ issue`

> Note: Branch name must contain 4 digit issue number for this to work
>
> Example: `git checkout -b 3734-add-visit-counter-to-filter`
>
> Example: `git checkout -b bug-fix-4343-issue`



###### The Pull Request Your Current Branch Is Attached To

`$ request`

> Note: Branch name must contain 4 digit issue number and have open PR for this to work



## Branches Manager



##### Branch Manager Allows you to Compare and Perform Many Actions for Branches

---



###### Print a List of all Branches and Then Select Branch for Further Actions

`$ branches`



```bash
[BRANCHES MANAGER]

Listing branches by most recent commit:

1: master
2: 1163-customize-contacts-avatars
3: upgrade-ember-version-3879

Select branch

```



> When prompted, enter the number of the branch you want and you will be presented with actions



```bash
Selected branch 'remove-flash-notices-1163'

1: Checkout branch
2: Checkout branch and open branch manager
3: Checkout branch in all affected Leadfeeder Repos
4: Copy branch name to clipboard
5: Delete branch [WARNING]

Select option

```



> When prompted, simply enter the number of the action you want to take



## Branch Manager



##### Branch Manager Allows you to Perform Many Actions for your Current Branch

------



###### Print a List of Actions

`$ branch`



```bash
[BRANCH MANAGER]

Options for current branch '4302-reinstall-wooden-gutter-graphics':

1: Open web browser to github issue
2: Open web browser to github request
3: Compare files in file manager
4: Checkout branch in all affected Leadfeeder Repos
5: Copy branch name to clipboard
6: Delete branch [WARNING]

Select option

```



> When prompted, simply enter the number of the action you want to take



## File Manager



##### File Manager Allows you to See and Edit Files Which You Have Changed in your Current Branch

------



###### Print a List of Actions

`$ files`



```bash
[FILE MANAGER]

Compare files in branch '3938-send-test-slack-message-feature':

1: files modified since last commit
2: files different from master
3: conflicting filese in current rebase

Select option

```



> When prompted, enter the number of the files you want and you will be presented with actions



```bash
Available options for files different from master:

1: open files in text editor
2: print filenames in terminal
3: copy filenames to clipboard

Select action

```



> When prompted, simply enter the number of the action you want to take



```bash
# Hint: You can make selections as you call the managers by passing the selection(s) as an argument

# Examples:

$ branch 4
# Checkout current branch in all leadfeeder repos with the same branch name

$ files 2 1
# Quickly open text editor to any files modified since branched from master
```





## Quick Editing Or Viewing Recently Changed Files



##### Open All Recently Changed Files In Text Editor -or- See/Copy All Recently Changed Filenames

---



###### Any Files Modified Since Latest Commit

`$ editmod` -or- `$ copymod`

> Only useful when `git status` shows modified files



###### Any Files Different From Master

`$ editdif` -or - `$ catdif` / `$ copydif`

> Only useful when branch has new changes since branching from master



###### Any Conflicting Files (in rebase)

`$ editconf` -or - `$ catconf` / `$ copyconf`

> Only useful during a rebase



```bash
# Hint: Copying all filenames as a single line can be useful for running commands on all of the files

# Example:
$ rubocop <paste filenames here>
```





## Rubocop Code Checking



##### Check Those Files Before You Commit Them

---



###### Run Rubocop Code Checker Only on Ruby Files Changed Since Latest Commit

`$ cop` 

> Be sure you have gems `rubocop` and `rubocop-rspec` installed



## Web Searching



##### Search the Web From One Command in your Terminal

------



###### Google Search

`$ google what is the weather in Helsinki?`

> To search google from the command line simply type the word `google` followed by a space and then then query you wish to search for



###### Stack Overflow Search

`$ stack how do I create a for each loop in ember`

> The same as with the google search but with the prefix `stack`



###### Wikipedia Search

`$ wiki fibonacci number`

> The same as with the google search but with the prefix `wiki`



## And More...



##### Search through the files and you will see a few more helpful aliases







```
version 1.0.0
created by Keyan Bagheri
https://github.com/keyanbagheri
```

