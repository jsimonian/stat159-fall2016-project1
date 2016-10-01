# Stat 159, Fall 2016, Project 1
## Usage of computational tools in reproducible research

## Author: Joseph Simonian

## Contents:
- [Abstract](#abstract)
- [Introduction](#introduction)
- [Discussion](#discussion)
    - [Git](#git)
    - [GitHub](#github)
    - [Markdown](#markdown)
    - [Makefiles](#makefile)
    - [Pandoc](#pandoc)
- [Conclusions](#conclusions)

## Abstract:

Modern research papers involve more computational methods than ever before, with researchers in a variety of fields implementing complex programs and utilizing large datasets. Without access to the original code and data, it is often impossible to reproduce the findings in such papers. As such, certain tools have become essential to the paper generation and presentation. In this paper, I will introduce a number of tools that aid in research reproducibility, and examine the basics of their usage.
## Introduction

While generating a reproducible workflow may involve a wide variety of tools, there are a few which are extremely in modern research. In this paper, I will examine the following popular tools:

- Git
- Github
- Markdown
- Makefiles
- pandoc

I will provide a brief discussion of the usage of each tool, and of how I used it in generating this document. I will also include links to tutorials that discuss more advanced usage of each tool. By the end of the paper, you should have the necessary knowledge to generate a paper similar to this one.
## Discussion

### Git

![Git logo](https://raw.githubusercontent.com/jsimonian/stat159-fall2016-project1/master/images/git-logo.png)

Git is a Version Control System (VCS) - a tool used to manages changes across a large project or codebase. The advantages of version control in reproducible research are clear: with version control, authors can make modifications to their work without fear of damaging previous work, since they can roll back to earlier versions at any time. What's more, as a *Distributed* VCS, git aids authors in collaborating with others, allowing many people to work on a project at the same time without overwriting each other's work.

The mechanics of git are quite complex, so I will only discuss the basics of usage. I will run through commands, and then discuss a common approach towards project creation in a large group.

A list of git commands:

- `git init`: Initialize a new git repository (repo). This can be used in an empty directory, or can be used to convert an existing project to a git repo. This is one of two ways to generate a git repo, along with `git clone`.

- `git clone`: Copy an existing repo from a remote source. This will create a "working copy" of the repo, and label the source as "origin" in git's list of remote locations.

- `git commit`: Save a snapshot any staged changes, allowing rollback to the state of the directory at the time of the commit. Before a commit, modified files must be *staged* with `git add`. This commit is saved to the *branch* that you are currently working on. Branching allows multiple "most recent" copies to be stored at once, allowing for the existence of multiple versions of projects or papers.

- `git add`: Stage files for an upcoming commit. While this signifies that you intend to snapshot the file in the next commit, it does not actually do so until `git commit` is run.

- `git status`: Display information about currently staged files, and about newly modified files that have yet to be staged.

- `git log`: Display a log of past commits, listing their messages and id numbers.

- `git checkout`: Restore your system to its previous snapshotted state at the time of any previous commit, or set it match to the most recent commit to any branch.

- `git merge`: Merge the snapshotted data from a specific commit into your current system, as long as there are no conflicting changes to the files in the directory since the branch was split off. With branching and merging, two sections of the same file can be edited at different times on differing branches, and then merged into a finished version with both sets of changes included.

- `git push`: Upload new commits to a remote repository, merging your local snapshot into the remote version.

- `git pull`: Download new commits from a remote repository, merging the remote snapshot into your local system.

To get more information on the usage of any of these commands, simply run `git help <command>` from your command line (for example, `git help push`). While there are many other `git` commands, the ones described above should be enough to implement a simple workflow. I will describe an example workflow in the section on *Github*. For more imformation on using `git`, check out [github's 15-minute intro](https://try.github.io/levels/1/challenges/1).

### Github

![Githib Logo](https://raw.githubusercontent.com/jsimonian/stat159-fall2016-project1/master/images/github-logo.png)

Github is a website that performs remote hosting of git repositories. Its use is quite simple, acting mostly as a graphical interface for git usage, and as a place to store "master copies" of projects that are being edited by a large number of people. Its public nature also allows quick distribution of projects to other researchers. I'll now give a quick rundown on how github can be used in conjunction with git in order to facilitate collaboration within a large group.

The most basic git workflow is simply the change->add->commit->push workflow: working alone, an author edits files, stages their changes, commits their changes locally, and finally uploads their changes to github to store them remotely (and make them public). This is the workflow I used in the creation of this project.

A more complex workflow, between a team of several collaborators, could go as follows. While github acts as the master copy of the project, each collaborator can perform their own work on their own machine, overwriting their local versions of the project files. When they finish making addition, they can push their changes to github to merge them into the master copy. If collaborators wish, they can work together on changes by creating a branch of the repository and modifying it. Once the collaborative work is complete, the branch can be merged into the master copy, in the same manner as individual commits would be.

Github has many more features that have made it a widely used tool in combination with git. For more information of github, check out their own [Github Guides](https://guides.github.com/).

### Markdown

![Markdown Logo](https://raw.githubusercontent.com/jsimonian/stat159-fall2016-project1/master/images/markdown-logo.png)

Markdown is a simple markup language, designed to be easy to read and easily convertible to HTML. This writeup itself is actually written in markdown, and converted to HTML via pandoc. (If you want to view the markdown code itself, click "Raw" at the top of this file in github). Markdown is designed to allow easy addition of images, links, code and graphics into documents. I'll present a few markdown commands, via example, below:

### Headers

- Prefacing a line with one to six "#" characters will make the line into a header. The more characters, the smaller the header. This document includes headers with one, two, and three "#" prefaces.

[Links](http://http://joseph.simonian.me) and inline images ![Stat159](https://raw.githubusercontent.com/jsimonian/stat159-fall2016-project1/master/images/stat159-logo.png)

- Links are created in markdown by the following format: `[Link Text](link URL)`. For example, the above link is written as `[Links](http://http://joseph.simonian.me)`. Inline images are created in a similar way, with the format being `![Alt Text](image URL)`. The above image was written as `![Stat159](https://raw.githubusercontent.com/jsimonian/stat159-fall2016-project1/master/images/stat159-logo.png)`.

**Bold**, *Italics*, and `code`

- Text can be made bold by surrounding it with double \* characters, for example, `**Bold Text**`. Italicization works similarly, with single \* characters, for example, `*Italicized Text*`. Code fonts can be applied with the grave accent character (\`), in a similar way.

1. Lists
2. And
3. Sublists

- Lists are very intuitive in markdown, creating simply by prefacing each line of the list with a \- or \* character, or with a number. Sublists can be created by simply tabbing in the lines of the sublist to the necessary depth.

While there are many more markdown commands, this is sufficient to provide a basic introduction. More information can be found in the dynamic tutorial at [markdowntutorial.com](http://www.markdowntutorial.com/).

### Makefile

**make** is a tool used for software build automation - that is, the process of compiling software from the form it is edited in, to the form that it is presented or run in. In the context of reproducible research, it is often used to create the final presented version of a paper from constituent parts, in addition to its role in compiling and running code.

A common usage for `make` is keeping final files up-to-date with minimum effort. If many part files are used in the generation of one final project file, then re-compiling the project file will generally require all of the part files to be up-to-date. Re-compiling them all by hand would be tedious, so `make` is used to automate the compilation process in a single command. In addition, for very complex projects, the process of  re-compiling all of the independent part files could take quite a bit of time. In those situation, `make` allows compilation of only those files which have been modified since the project file was last generated.

Commands for the make tool are stored in a file called a **makefile**, which is usually named `Makefile` or `makefile`. The syntax used to define these commands, or **rules** is quite simple. Most rules consist of a structure like the one below:

```bash
target: dependencies
  commands
```

- `target`: The name of the action carried out: running `make target` in bash will perform the shell commands associated with the rule. Generally, the target refers to a file which will be generated by the command.
- `dependencies`: A list of commands that must be run before this command - commands that have a `dependency` with the same name as the `target` of another command will be not be run until the completion of the other command. These will generally be the names of files that are required to compile the target file.
- `commands`: The shell commands that will be invoked in order to generate the `target`

As an example, I will discuss the makefile for this paper. It uses a number of "advanced" commands, so I will reproduce it here with a simpler syntax:

```bash
.PHONY: all clean

all: paper.md paper.html

paper.md:
	cat paper/sections/* > paper/paper.md

paper.html: paper.md
	pandoc paper/paper.md -s -o paper/paper.md

clean:
	cd paper; rm paper.md; rm paper.html
```

We can examine each of the commands to see a number of features of `make`:

- `.PHONY`: The dependencies of the special target .PHONY are considered to be phony targets - that is, they are not the name of a file, merely an action that should be carried out by the `make` command. This listing is used to prevent confusion of a target such as `all` with a file by the same name. Common phony targets are `all` and `clean`.

- `all`: A common phony target, generally used to compile all sections of a project or paper. Often it will not require any commands, simply listing all "top-level" `rule`s as dependencies. Since running `make` from command line without listing a target will automatically run the first target, the `all` target is conventionally listed first.

- `paper.md`: This target compiles the file `paper.md`, by concatenating all of its constituent parts (the markdown files found in the `sections` directory). Note that bash wildcards are allowed in these commands.

- `paper.html`: This target compiles the file `paper.html`, by invoking `pandoc` (a document converter which I will cover shortly) on `paper.md`.

- `clean`: Another phony target, `clean` is generally used to remove final project files - generally, this would include every file that is created using make. As you can see, to write multiple bash commands in a single `rule`, it is necessary to place all commands on the same line.

This should cover the basics of `make`, and how it is used in this project. For more information on *make*, see [Gaston Sanchez's excellent introduction](https://github.com/unix-tools/tutorial-makefiles).

### Pandoc

![Pandoc Logo](https://raw.githubusercontent.com/jsimonian/stat159-fall2016-project1/master/images/pandoc-logo.png)

Pandoc is a document converter, a tool used to convert files to different formats. In this project, I have used it to convert my markdown project to an HTML file. As the banner states, pandoc can read and write a wide variety of document formats, including markdown, HTML, LaTeX, Office Open XML (.docx), and Wiki markup.

While pandoc has many uses, its basic usage is extremely simple. It is invoked via the `pandoc` command on command-line. Common usage includes the flag `-s`, which tells pandoc to write a full document, not just a "document fragment". Output is to stdout (print to console) by default, with the `-o` flag used to specify that output should go to a specific file. Thus, a basic usage of `pandoc` for this project would be:

```bash
pandoc paper/paper.md -s -o paper/paper.md
```

Since pandoc can take multiple files and automatically concatenate them into a single output file, that command could also be invoked as:

```bash
pandoc paper/sections/* -s -o paper/paper.md
```

Using the individual `.md` files under the `sections` directory to create the output file.

With the addition LaTeX, we can also use pandoc to generate PDFs:

```bash
pandoc paper/paper.md --latex-engine=xelatex -o paper/final_paper.pdf
```

In either example, the filename of the output is customizable. However, pandoc infers its format conversion rules based upon the listed file extension of the input and output files, so those must match the data contained in the files themselves.

Pandoc is an extremely useful tool in generating elegant output from raw markdown files. It can be seen for markdown files as similar to the latex compiler, converting a file written in a markup language into a file that can be read directly.
## Conclusions

I hope that this paper has given you a good introduction to each of these tools, and how each one can be used in the creation of reproducible research.

To prepare this paper, I mostly referred to the tutorials that I cited throughout the discussion section, at the end of the blurb on each tool.

The discussions on markdown and github were the easiest parts, since I had just done the markdown lab for this course, and have a good deal of experience with github.The git and makefile introductions were the most difficult parts, as I had to consider how I would try to explain `git` and `make` to people with no prior knowledge of them.

I didn't really get stuck at any point, since I have at least some experience with all of the tools I covered. The most time consuming parts were probably `git` and `make`, both because of the difficulty of covering them and because I tried to explain a somewhat large number of commands/syntax for each.

I worked on my own, consulting only the resources I listed throughout the paper, and your materials from Stat 159 (labs etc.). Looking at my commit history, it seems that the project took me about 8 hours to complete - three on one day, and five on another.
