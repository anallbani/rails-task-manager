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

Open [http://localhost:3000/tasks](http://localhost:3000/tasks) in your browser
to view the example tasks.

## Running tests

The project uses Minitest. Execute the test suite with:

```bash
rails test
```
