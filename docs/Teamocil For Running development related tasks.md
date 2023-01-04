I have found a very good tool to run various command to run your project server in one command. If you use `tmux` (Terminal Multiplexer) it is very handy to run development related command for your daily work. 



Let's say you are working in **NAVA 360** project. So, you need to run

- PHP Server

- NPM Bundle Runner like mix

- Jobs

- server.js

- Second window for MySQL command line

- Third window for Tinker shell

- Fourth window for misc. use



The tool is called [teamocil](https://github.com/remi/teamocil) can be installed using `gem install teamocil`. You can go to `teamocil` github repository for more instruction about it. Here is the below example for running session for `NAVA-360` server:



```yaml
name: NAVA-360-SERVER
windows:
  - name: Booter
    root: ~/code/nava/nava-360
    layout: tiled
    panes:
      - commands:
        - git checkout 360-dev
        - git pull
        - php artisan serve --host=0.0.0.0 --port=9998
      - npm run watch
      - php artisan horizon
      - node nodejs/server.js

  - name: MySQL
    root: ~/code/nava/nava-360
    layout: 6116,150x36,0,0,36
    panes:
      - mysql -uroot -proot tenant360

  - name: Tinker
    root: ~/code/nava/nava-360
    layout: 6116,150x36,0,0,36
    panes:
        - php artisan ti

  - name: Other
    root: ~/code/nava/nava-360
    layout: 6116,150x36,0,0,36
    panes:
        - nvim .
```

It will create a session called `NAVA-360-SERVER` with four window and first window will have four `panes/frames`. And every window has a name like Booter, MySQL, Tinker and Other.

For first window and first pane I have checked in to 360-dev branch and synced with the remote repository and then ran the php dev server. For the second pane I ran mix bundler. In the third pane I ran the horizon to watch every job that has been dispatched from the application.

For the second window it has only one pane which will be used for MySQL command line.

Third one which has only one pane will be used to access the tinker shell.

The last window (Other) will open the `neovim` (command line text editor?(IDE)).



Here are more `yaml` files that can be listed below:



### Manocha Server

```yaml
name: MANOCHA-SERVER
windows:
  - name: Booter
    root: ~/code/manocha-server
    layout: main-vertical
    panes:
      - commands:
        - git checkout dev
        - git pull
        - php artisan serve --host=0.0.0.0 --port=9997
      - npm run watch
      - php artisan queue:work --tries=1

  - name: MySQL
    root: ~/code/manocha-server
    layout: 6116,150x36,0,0,36
    panes:
      - mysql -uroot -proot manocha

  - name: Tinker
    root: ~/code/manocha-server
    layout: 6116,150x36,0,0,36
    panes:
        - php artisan ti

  - name: Other
    root: ~/code/manocha-server
    layout: 6116,150x36,0,0,36
    panes:
      - nvim .

```



### NAVA 360 Frontend

```yaml
name: NAVA-360-APP
windows:
  - name: Booter
    root: ~/code/nava-360-app/nava-whitelabel
    layout: even-horizontal
    panes:
      - commands:
        - git checkout 360-dev
        - git pull
        - grunt serve
      - htop

  - name: Dev
    root: ~/code/nava-360-app
    layout: 6116,150x36,0,0,36
    panes:
      - pwd

  - name: Other
    root: ~/code/nava-360-app
    layout: 6116,150x36,0,0,36
    panes:
        - echo Hello Surajit!
```



### Manocha Frontend

```yaml
name: MANOCHA-APP
windows:
  - name: Booter
    root: ~/code/manocha-app
    layout: even-horizontal
    panes:
      - commands:
        - git checkout dev
        - git pull
        - nvm use 11 && ionic serve --external
      - htop

  - name: Dev
    root: ~/code/manocha-app
    layout: 6116,150x36,0,0,36
    panes:
      - pwd

  - name: Other
    root: ~/code/manocha-app
    layout: 6116,150x36,0,0,36
    panes:
        - echo Hello Surajit!
```



Now to run one of the project session you simply need to run below command

```bash
teamocil --here nava-360-server
```

It will create a NAVA-360-SERVER session for you and will run the command you specified in your `yaml` file.
