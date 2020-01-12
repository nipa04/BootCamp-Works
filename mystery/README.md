# Bitmaker Mystery
Today we'll be doing a *Choose Your Own Adventure* story with a twist.

## Background knowledge
* git fundamentals (tracking files, committing)

## Learning Goals
* branching
* merging

## Getting Started
It's recommended that you **work solo** on this assignment. Working in teams will make the process more complicated and confusing, and therefore you should try this on your own.

In today's assignment, we're going to **take a step away from code** for a bit, and instead do a Choose Your Own Adventure. In case you've never had the pleasure of reading a Choose Your Own Adventure story, the idea is pretty simple. At key points within the story, you'll be presented with a choice, and your choices will effect the outcome of the story.

There's a twist to the usual formula though. Rather than simply making our choices and living with the outcome, we're going to cheat a little. Sometimes in a Choose Your Own Adventure story, one of your choices will lead you to an undesirable result. So instead of accepting whatever outcome we arrive at, we'll use the power of git branches and merges to jump between all the possible choices we could make, see where they lead, and make a final choice once we're satisfied with the outcome.


### Key Concepts
To succeed in this assignment, you'll need to understand what a **git branch** and a **git merge** are.

Branches allow us to break off from our *master* branch, where all our final decisions will be recorded. This way we can experiment without committing to some final result.

Once we're happy with the state of our branch, and we feel like its safe to make our decisions final, we'll merge the branch back into *master*. The *master* branch should be considered our final source of truth, so we should try to make sure that we're happy with our decisions before we merge into it.

### Making Choices
The story will be presented as a few paragraphs of text, followed by a multiple choice. Each choice will be presented as a simple link. Each choice will lead you to the next part of the story, which will either present you with another set of choices, or an ending. You'll record all of our choices in a file as we go, `CHOICES.txt`. The trick is that **we won't ever delete anything from this file** if we don't like a choice we've made, instead we'll use the power of branches to rewind time.

Progressing through the story and making choices will look something like this:
1. First, make a **branch** in git. This way if you end up not liking the choice you made, you can simply switch back to *master*.
1. Next, read through the story up to that point, and decide what choice you want to make. Don't click on the link just yet, just decide what choice you're going to make.
1. Record your choice in the `CHOICES.txt` file. Simply record the option you chose at whatever part of the story you're at. Make a **git commit** representing the choice.
1. Back over in the story text on Github, the choice you chose will have a link. Click on it, and read the next part of the story.
1. If the choice you made **didn't lead to a bad ending**, go back to *master* and merge your branch into *master*. Make sure you reread and you're happy with the choice before merging. Once you've merged, make a new branch, and go back to **Step 2** until you reach an ending you like.
1. If the choice you made **did lead to a bad ending**, go back to master, and **without merging your old branch** make a new branch off of *master*, and go back to **Step 2** until you reach an ending you like. Also, don't delete any of your old branches for now.

One more thing. If at any point, you feel like you explored all the choices you could, and it's impossible to proceed, click on [this link](https://github.com/bitmakerlabs/mystery/blob/master/story/6a.md) to get a hint. Try to hold off for as long as possible or you'll spoil the story!

Alright, [let's jump into the story!](https://github.com/bitmakerlabs/mystery/blob/master/story/intro.md)
