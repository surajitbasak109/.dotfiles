# Vim tips: Folding fun

Using Vim’s folding features, you can tuck away portions of a file’s text so that they’re out of sight until you want to work with them again. Here’s how.

Vim’s folding commands begin with `z`. If you want to do something with folding, it probably starts with `z`. (Since Vim 7 added spellchecking, some of the spellcheck commands also start with z, but that’s a topic for another article.)

## Creating folds

Let’s start with some simple folding actions. Pick a text file, preferably a longer one like your xorg.conf, or just about any text file that’s too big to fit on the screen by itself. Open it in Vim, and place the cursor at the beginning of a paragraph. Make sure you’re in normal mode, and type `zf2j`. After you press `j`, Vim will create a fold covering three lines — the line you started the fold on, and the next two lines. If you’re familiar with Vim’s movement commands, you know that the command `2j` would usually tell Vim to move down two lines. Vim uses the same movement commands to define folds.

Folding also works in visual mode. If you enter visual mode using `v` or `V`, then select a few lines of text using the movement keys, and type `zf`, Vim will create a fold comprising those lines.

Another option is to specify a range in command mode. For instance, if you wanted to create a fold from lines 20 through 101, you could just use `:20,101 fold` and press Enter. In fact, you don’t even need to type the entire word — you can use fo instead of fold if you want to save a couple of keystrokes. Note that this will work backwards as well — so if you use `:.,20 fo` when the cursor is on line 101, Vim will reverse the range and create the fold from lines 20 to 101.

Vim can also make some smart text selections. Let’s say you’re working on a script or program and you have a block of text within braces ({}). Position the cursor on the first brace, and type `zfa}`. Vim will create a fold from the line with the first brace through the last; it’s not necessary to know which lines you’re working with, Vim will just look for the closing brace. This also works with other block enclosures — parenthesis, brackets ([]), and angle brackets (<>).

As an added bonus, Vim also recognizes nested blocks, so it will create the fold based on matching delimiters, and not the first closing bracket it comes across. Vim will also work backwards. If you’re on a closing brace, type `zfa{` and Vim will create a fold from the current spot to the beginning brace.

Folds are nestable as well — that is to say, you can create a fold, and then include that within a larger section of folded text.

Finally, you can create a fold from the cursor position to a search result. If you run `zf/string`, Vim will create a fold from the cursor position to the first instance of the search string. Again, this is useful when you know you want a fold to go from the line you’re on to a line further down in the file, but you’re not sure what the line number is.

Once you’ve created a fold you’ll see a single line of text that shows how many lines are folded, as well as the initial text, like this:

```
+-- 15 lines: set_up_socket_dir () {--------------------------------------------
```
The dashes indicate the foldlevel of the particular fold. For a top-level fold, you should see two dashes. Nested folds will have more dashes. We’ll cover the foldlevel in more depth in just a bit.

## Using folds

Creating folds is only half the fun. At some point, you’ll no doubt want to unfold the text. One way to do this is to place the cursor on the same line as the fold and type zo. This will “open” the fold, but not delete it. So if you want to do a quick check on some text that’s been folded, use zo, and then zc to close it back up when you’re finished.

To move between folds quickly, use the zj and zk commands to move to the next and previous fold. Note that it doesn’t matter whether the folds are open or closed; if they exist, zj and zk will move backwards and forwards between them. These commands should be easy to remember, since they combine the fold command (z) with movement commands (j to move down a line, and k to move up a line). If you want to move between the start and end of a fold, use [z and ]z, respectively.

As we’ve already covered, Vim will create nested folds. If you use zo on a nested fold, it will open only the first fold — the remaining folds will stay closed. However, if you’d like to open all of the nested folds on that line, use zO — Vim will open all of the folds. Running zc in normal mode will close all the folds after using zO.

The zr command will open all first-level folds in Vim, and zR will open all of the folds in the file. The zm command will re-fold the first-level folds, and zM will close all open folds in a file. If you have multiple foldlevels, a fold within a fold within a fold, running zm will refold them sequentially — so if all folds are open it will refold the deepest folds, then folds on the next foldlevel, and so on. The zr command works the same way, only in reverse — it will open the top-level fold, then the next level, and so forth.

When you decide you want to get rid of a fold entirely, position the cursor on the fold and run zd. This will work whether the fold is open or closed. To zap all of the folds at once, type zE. Delete with caution, however. Vim’s undo and redo features don’t apply to folds; if you delete a fold, you can’t press u and bring it back, and the . command won’t run the last fold command.

You might be wondering, how does Vim treat text within folds when you are searching for text, or doing a search and replace on a file? Vim treats the text normally. If you search for a string of text that’s within a fold, Vim will unfold the text when the cursor moves to the string within the fold. Unfortunately, Vim is a little less than tidy in this regard — if a search causes a fold to be expanded, Vim doesn’t re-fold the text after moving the cursor outside the fold. However, a quick zm will restore the folds.

Vim also treats a folded section of text as a single line for the purpose of deleting and yanking text. If you place the cursor on a section of folded text and use dd, it will delete the entire section, not just the first line. Vim will also allow you to yank the entire folded section of text just by placing the cursor on the folded text and typing Y or yy. The folded section can then be pasted into another section of the text using the p or P commands.

### Vim folding commands

| command | Description |
|:-------:| ----------- |
|zf#j| creates a fold from the cursor down # lines.|
|zf/string| creates a fold from the cursor to string.|
|zj| moves the cursor to the next fold.|
|zk| moves the cursor to the previous fold.|
|zo| opens a fold at the cursor.|
|zO| opens all folds at the cursor.|
|zm| increases the foldlevel by one.|
|zM| closes all open folds.|
|zr| decreases the foldlevel by one.|
|zR| decreases the foldlevel to zero — all folds will be open.|
|zd| deletes the fold at the cursor.|
|zE| deletes all folds.|
|[z| move to start of open fold.|
|]z| move to end of open fold.|

## The foldmethod option

Vim’s foldmethod option might be of interest to programmers. The default foldmethod is manual — that is, creating folds manually. However, Vim can also create folds based on the way a file is indented, its syntax, or markers in the text.

To set the foldmethod according to the way a file is indented, run :set foldmethod=indent. This will automatically create folds at every indent. Consider a Cascading Style Sheet (CSS) file like this one:

```css
body {
        background-color: #CCCCCC;
	font-family: arial, helvetica, sans-serif;
}

strong.header {
        font-family: arial, helvetica, sans-serif;
        color: #1D3C47;
}
```
Once you’ve set foldmethod=indent, it will look like this:

```
body {
+---  2 lines: background-color: #CCCCCC;---------------------------------------
}

strong.header {
+---  2 lines: font-family: arial, helvetica, sans-serif;-----------------------
}
```
Vim also offers a marker method, where folds are set by visible text markers rather than invisible manual marks. To set this mode, run :set foldmethod=marker. Then, when you set a fold, you’ll see a marker with three braces at the beginning and end of the fold, like this:

```
/*{{{*/
Folded text goes here...
/*}}}*/
```

The braces are set off by comment characters, depending on the type of file. So, if you’re working with an HTML file, you’ll see <!--{{{-->, and if you’re editing a Python script, you’ll see #{{{. You can also insert fold markers manually if you want, and Vim will recognize them as well. Vim will also delete the markers with the zd command, whether they were set manually or not.

Fold created with the marker method are subject to undo and redo operations, unlike normal manual folds.

It’s possible to set the foldmarker to something other than {{{ if you need to, but the Vim docs recommend that you stick with the defaults. To change the foldmarker, use :set foldmarker=nnn,mmm where nnn is the character string to start the marker, and mmm is the string to end the marker.

If you want to use a foldmethod other than “manual” all the time, add this line to your ~/.vimrc:

```
set foldmethod=foldoption
```
## Saving folds

After you’ve gone to all the trouble of creating several folds in a longer document, it’d be a shame to lose them when you close the file. If you’d like to save the folds before you leave the file, run :mkview. When you reload the file, run :loadview, and Vim will restore the folds to the state the file was in at the time you ran :mkview.

The :mkview command supports multiple revisions of a file’s state, so you can give a view a number and reload later on. For example, if you run :mkview 2, make a few changes, and then run :loadview 2, it will revert to the previous state of the file as far as folds are concerned. Note that it won’t restore the file itself to the previous state; if you delete 10 lines of text after saving a view, Vim won’t restore those lines when you load an older view using :loadview.

But why do something manually when you can do it automatically? To see to it that Vim saves and restores folds when a file is closed and re-opened, add these two lines to your ~/.vimrc:

```vim
au BufWinLeave * mkview
au BufWinEnter * silent loadview
```

Now, each time you close a file, its fold state will be saved and reloaded when you reopen the file in Vim.

When you add folds to other features like viewports and marks and jumps, Vim becomes an insanely productive tool for text editing and programming.
