# Task Manager

This is a tiny Rails application used to manage a list of tasks. The project is
meant as a starting point for learning Rails and experimenting with the
framework.

## Setup

First install the Ruby gems:

```bash
bundle install
```

Create and seed the database (this will load a few example tasks defined in
`db/seeds.rb`):

```bash
rails db:setup
```

Start the development server:

```bash
rails server
```

The application uses Tailwind CSS. In development you need the Tailwind watcher
running so it compiles `app/assets/stylesheets/application.tailwind.css` into
`app/assets/builds/tailwind.css`.

You can run Rails and the Tailwind watcher together with:

```bash
# start Rails and Tailwind in development
bin/dev
```

Alternatively, run `rails tailwindcss:watch` in a separate terminal while the
Rails server is running.

Open [http://localhost:3000/tasks](http://localhost:3000/tasks) in your browser
to view the example tasks.

## Running tests

The project uses Minitest. Execute the test suite with:

```bash
rails test
```
